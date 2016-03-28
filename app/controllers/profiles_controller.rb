class ProfilesController < ApplicationController
  before_filter :authenticate!

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      redirect_to :back, notice: 'Sikeresen frissítve!'
    else
      render 'edit'
    end
  end

  private
  
  def profile_params
    params.required(:profile).permit(:first_name, :last_name, :nick_name, :avatar)
  end

  def authenticate!
    if teacher_signed_in?
      @profile = current_teacher.profile
      true
    else
      authenticate_student!
      @profile = current_student.profile
    end
  end
end
