module Admin
  class LessonsController < AdminController

    def show
      @lesson = Lesson.find(params[:id])
      @sections = @lesson.sections

      add_breadcrumbs
    end

    def new
      @lesson = Lesson.new
      @section = Section.find(params[:section_id])
    end

    def create
      @lesson = Lesson.new(lesson_params)

      if @lesson.save
        redirect_to admin_section_path(@lesson.section), notice: 'Lesson created!'
      else
        render 'new'
      end
    end

    def edit
      @lesson = Lesson.find(params[:id])
      @section = @lesson.section
    end

    def update
      @lesson = Lesson.find(params[:id])

      if @lesson.update_attributes(lesson_params)
        redirect_to admin_section_path(@lesson.section), notice: 'Lesson successfully updated!'
      else
        render 'edit'
      end
    end

    def destroy
      @lesson = Lesson.find(params[:id])
      @lesson.destroy

      redirect_to admin_section_path(@lesson.section), notice: 'Lesson successfully destroyed!'
    end

    private

    def lesson_params
      params.required(:lesson).permit(:name, :file, :section_id, :visibility)
    end

    def add_breadcrumbs
      add_breadcrumb :root, admin_courses_path
      add_breadcrumb @section.course.name, admin_course_path(@section.course)
      add_breadcrumb @section.name, admin_section_path(@section)
      add_breadcrumb @lesson.name
    end
  end
end
