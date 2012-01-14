class Solution
  include Mongoid::Document
  include Mongoid::Timestamps
  field :code

  referenced_in :problem
  referenced_in :user
  references_many :votes

  validate :run_problem
  after_create :update_user_solution_count, :create_upvote_for_solution

  def score
    votes.upvote.count - votes.downvote.count
  end

  protected

    def run_problem
      executor = CodeExecutor.new(problem.code.gsub("__", self.code))
      result = executor.execute
      executor.errors.each {|e| errors.add(:base, e)}
      return result
    end

    def create_upvote_for_solution
      self.votes.create(:user => user, :up => true) if user
    end

    def update_user_solution_count
      # TODO: find all the solutions and update the user's solution count?
      if user_id && (updating_user = User.find(self.user_id))
        updating_user.solution_count = user.solution_count ? user.solution_count + 1 : 1
        updating_user.save
      end
    end
    
end
