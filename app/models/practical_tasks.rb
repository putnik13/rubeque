class Practical_task
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Audit::Trackable

  field :title
  field :_id, type: String, default: ->{ title.to_s.parameterize }

  field :instructions
  field :code
  field :hidden_code
  field :difficulty, type: Integer
  field :approved, type: Boolean
  field :excluded_methods, type: Array
  field :order_number, type: Integer

  has_many :solutions, dependent: :destroy
  belongs_to :creator, class_name: "User"
  belongs_to :next_problem, class_name: "Problem"
  embeds_many :tags

  scope :approved, proc{ where(approved: true ) }
  scope :unapproved, proc{ any_of({approved: nil}, {approved: false}) }

  before_create :automatically_approve

  DIFFICULTY_LEVELS = ["1 week", "2 week", "3 week", "4 week"]

  validates_presence_of :title, :code, :difficulty
  validates_uniqueness_of :title

  validates_inclusion_of :difficulty, in: (0..3)

  track_history :track_create   => true,
                :track_destroy  => true

  def to_s
    "#{title}"
  end

  def status
    approved? ? "approved" : "unapproved"
  end

  def solved?(user)
    !solution_for(user).nil?
  end

  def approve
    update_attribute(:approved, true)
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(tag_list)
    self.tags = tag_list.split(",").map(&:strip).uniq.map{|t| Tag.new(name: t)}
  end

  def difficulty_word
    DIFFICULTY_LEVELS[read_attribute(:difficulty).to_i]
  end

  def value
    self.difficulty
  end

  def solution_for(user)
    solutions.where(:user_id => user.id).first if user
  end

  private

    def automatically_approve
      approved = true if creator && creator.admin?
    end
end
