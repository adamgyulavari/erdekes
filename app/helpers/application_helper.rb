module ApplicationHelper
  def lesson_path(lesson)
    if lesson.file_stored?
      lesson.file.url
    else
      super
    end
  end

  def user_signed_in?
    student_signed_in? || teacher_signed_in?
  end
end
