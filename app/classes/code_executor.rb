require 'sicuro'

class CodeExecutor
  MAX_EXECUTION_TIME = ENV['PROBLEM_MAX_TIME'] || 5 # seconds

  ERROR_PATTERNS = [
    /^SystemExit:/,
    /Error\S*:/,
    /Exception\S*:/,
    /^fatal/,
    /Interrupt\S*:/,
    /Errno::/
  ]

  attr_accessor :code, :errors, :time, :uid, :result

  def initialize(code, options = {})
    @code = code
    @result = options[:result]
    @excluded_methods = options[:excluded_methods]
    @errors = []
    @func = options[:func]
    @uid = generate_uid
    @full_code = options[:full_code]
    p '-'*30
    p @func
    p @result
    p @full_code
  end

  def execute
    timelimit = MAX_EXECUTION_TIME.to_i
    memlimit  = 350

    sandbox = Sicuro.new(memlimit, timelimit)
    begin
      start_time = Time.now
      p '-'*30
      p combined_code
      @result = sandbox.eval(combined_code)
      p @result.stderr
      p @result.stdout
      self.time = (Time.now - start_time)
    rescue Exception => e
      p "0"
      @errors << e.message
    end

    ERROR_PATTERNS.each {|re| @errors << result if result =~ re}
    if result == "<timeout hit>"
      p "1"
      @errors << "Your solution timed out."
    elsif result != @uid && @errors.empty?
      p "2"
      @errors << "Solution contained unexpected output or returned prematurely#{Rails.env.production? ? '.' : ": #{result}"}"
    end
    p "3"
    p @errors
    return @errors.empty?
  end

  def generate_uid
    UUID.new.generate
  end

  def post_code
    %{\nputs "#{@uid}"}
  end

  def pre_code
    PRECODE
  end

  def pre_code2
    PRECODE2
  end

  def combined_code2
    [pre_code, @code, post_code].join("\n")
  end
  def combined_code
    [pre_code, @full_code, ASSERT,  post_code].join("\n")
  end
  def result
    @result.to_s.strip
  end

  PRECODE2 = <<-code
    def assert_equal(x, y, message = nil)
      if x != y
        raise message ? message : "The value '\#{x}' does not equal '\#{y}'."
      else
        return true
      end
    end
  code

  PRECODE = <<-code
    def assert_equal(x, y, message = nil)
      if x != y
        raise message ? message : "The value '\#{x}' does not equal '\#{@result}'."
      else
        return true
      end
    end
  code
  
  ASSERT = <<-code
    "assert_equal '\#{@result}', '\#{@func}'"
  code
end
