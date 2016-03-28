class HomeController < ApplicationController
  def index
    @courses = Course.published
    if student_signed_in?
      @missions_bd = Mission.includes(section: :course)
                            .published
                            .before_deadline
                            .where.not(id: current_student.solutions.map{|s| s.mission_id})
    end
  end

  def static
  end

  def enaplo
    render json: {success: ENV['ENAPLO_STATUS'] == "ok"}
  end

  def console
    raise 'f'
  end
end
