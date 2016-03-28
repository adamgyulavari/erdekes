module Admin
  class SolutionsController < AdminController

    def new
      @solution = Solution.new
      @mission = Mission.find(params[:mission_id])
    end

    def create
      @solution = Solution.new(solution_params)

      if @solution.save
        redirect_to admin_mission_path(@solution.mission), notice: 'Solution created!'
      else
        render 'new'
      end
    end

    def edit
      @solution = Solution.find(params[:id])
      @mission = @solution.mission
    end

    def update
      @solution = Solution.find(params[:id])

      if @solution.update_attributes(solution_params)
        redirect_to admin_mission_path(@solution.mission), notice: 'Solution successfully updated!'
      else
        render 'edit'
      end
    end

    def destroy
      @solution = Solution.find(params[:id])
      @solution.destroy

      redirect_to admin_mission_path(@solution.mission), notice: 'Solution successfully destroyed!'
    end

    def result
      @solution = Solution.find(params[:id])
      @solution.result = params[:result].to_i
      if @solution.save
        respond_to do |format|
          format.js
        end
      else
        render :nothing, status: 400
      end
    end

    private

    def solution_params
      params.required(:solution).permit(:visibility, :source, :mission_id)
    end
  end
end
