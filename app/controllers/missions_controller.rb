class MissionsController < ApplicationController
  def show
    @mission = Mission.find(params[:id])
    @solution = @mission.solution_for(current_student) if student_signed_in?
  end
end
