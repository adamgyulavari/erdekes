class SolutionsController < ApplicationController
  before_filter :authenticate_student!

  def new
    @mission = Mission.find(params[:mission])
    @solution = Solution.new
    @solution.mission_id = params[:mission]
  end

  def create
    @solution = Solution.new(solution_params)
    @solution.student = current_student
    if @solution.save
      redirect_to root_path, notice: 'Megoldás feltöltve!'
    else
      @mission = @solution.mission
      render 'new'
    end
  end

  def edit
    @solution = Solution.where(student: current_student).find(params[:id])
    @mission = @solution.mission
  end

  def update
    @solution = Solution.where(student: current_student).find(params[:id])

    if @solution.update_attributes(solution_params)
      redirect_to root_path, notice: 'Megoldás módosítva'
    else
      @mission = @solution.mission
      render 'edit'
    end
  end

  private

  def solution_params
    params.required(:solution).permit(:source, :mission_id)
  end
end
