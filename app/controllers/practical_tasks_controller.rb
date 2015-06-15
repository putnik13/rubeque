class PracticalTasksController < ApplicationController
  def index
    @problems = Problem.approved.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @problems }
    end
  end

  def show
  	@problem = Problem.find(params[:id]) rescue nil
    if @problem.nil? || (!@problem.approved? && !current_user_admin?)
      flash[:error] = "Problem not found"
      redirect_to root_path and return
    end

    @solution = if current_user && (solution =  @problem.solutions.where(user_id: current_user.id).first)
      solution
    else
      Solution.new(problem: @problem, code: params[:solution_code])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @problem }
    end
  end

  def new
  end

  def create
  end
end