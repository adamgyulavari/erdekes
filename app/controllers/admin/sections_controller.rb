module Admin
  class SectionsController < AdminController

    def show
      @section = Section.find(params[:id])
      add_breadcrumbs
    end

    def new
      @section = Section.new
      @course = Course.find(params[:course_id])
    end

    def create
      @section = Section.new(section_params)

      if @section.save
        redirect_to admin_course_path(@section.course), notice: 'Section created!'
      else
        render 'new'
      end
    end

    def edit
      @section = Section.find(params[:id])
      @course = @section.course
    end

    def update
      @section = Section.find(params[:id])

      if @section.update_attributes(section_params)
        redirect_to admin_course_path(@section.course), notice: 'Section successfully updated!'
      else
        render 'edit'
      end
    end

    def destroy
      @section = Section.find(params[:id])
      @section.destroy

      redirect_to admin_course_path(@section.course), notice: 'Section successfully destroyed!'
    end

    private

    def section_params
      params.required(:section).permit(:name, :course_id, :visibility)
    end

    def add_breadcrumbs
      add_breadcrumb :root, admin_courses_path
      add_breadcrumb @section.course.name, admin_course_path(@section.course)
      add_breadcrumb @section.name
    end
  end
end
