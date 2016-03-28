module Admin
  class CoursesController < AdminController
    add_breadcrumb :index, :admin_courses_path

    def index
      @courses = Course.all
    end

    def show
      @course = Course.find(params[:id])
      @sections = @course.sections
      add_breadcrumb @course.name
    end

    def new
      @course = Course.new

    end

    def create
      @course = Course.new(course_params)

      if @course.save
        redirect_to admin_courses_path, notice: 'Course created!'
      else
        render 'new'
      end
    end

    def edit
      @course = Course.find(params[:id])
    end

    def update
      @course = Course.find(params[:id])

      if @course.update_attributes(course_params)
        redirect_to admin_courses_path, notice: 'Course successfully updated!'
      else
        render 'edit'
      end
    end

    def destroy
      @course = Course.find(params[:id])
      @course.destroy

      redirect_to admin_courses_path, notice: 'Course successfully destroyed!'
    end

    private

    def course_params
      params.required(:course).permit(:name, :description, :visibility)
    end
  end
end
