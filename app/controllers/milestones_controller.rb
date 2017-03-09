class MilestonesController < ApplicationController

    def index
      @project = Project.find(params[:project_id])
      @milestones = @project.milestones.all
    end

    def new
      @project = Project.find(params[:project_id])
    end

    def show
      @milestone = Milestone.find(params[:id])
    end

    def create
      @project = Project.find(params[:project_id])
      @milestone = @project.milestones.create(milestone_params)
      if @project.save
        redirect_to @milestone
      else
        render 'new'
      end
    end


  private

      def milestone_params
        params.require(:milestone).permit(:name, :person_responsible, :description,
                                     :completed)
      end
  end
