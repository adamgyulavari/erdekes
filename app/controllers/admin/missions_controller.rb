module Admin
  class MissionsController < AdminController

    def show
      @mission = Mission.find(params[:id])

      add_breadcrumbs
    end

    def new
      @mission = Mission.new
      @section = Section.find(params[:section_id])
    end

    def create
      @mission = Mission.new(mission_params)

      if @mission.save
        redirect_to admin_section_path(@mission.section), notice: 'Mission created!'
      else
        render 'new'
      end
    end

    def edit
      @mission = Mission.find(params[:id])
      @section = @mission.section
    end

    def update
      @mission = Mission.find(params[:id])

      if @mission.update_attributes(mission_params)
        redirect_to admin_section_path(@mission.section), notice: 'Mission successfully updated!'
      else
        render 'edit'
      end
    end

    def destroy
      @mission = Mission.find(params[:id])
      @mission.destroy

      redirect_to admin_section_path(@mission.section), notice: 'Mission successfully destroyed!'
    end

    private

    def mission_params
      params.required(:mission).permit(:name, :objectives, :description, :section_id, :visibility, :deadline)
    end

    def add_breadcrumbs
      add_breadcrumb :root, admin_courses_path
      add_breadcrumb @mission.section.course.name, admin_course_path(@mission.section.course)
      add_breadcrumb @mission.section.name, admin_section_path(@mission.section)
      add_breadcrumb @mission.name
    end
  end
end
