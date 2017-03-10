class MilestonesController < ApplicationController

    def index
      @project = Project.find(params[:project_id])
      @milestones = @project.milestones.all
    end

    def new
      @project = Project.find(params[:project_id])
    end

    def edit
      @project = Project.find(params[:project_id])
      @milestone = @project.milestones.find(params[:id])
    end

    def show
      @milestone = Milestone.find(params[:id])
      @milestone = @project.milestones.find(params[:id])
    end

    def create
      @project = Project.find(params[:project_id])
      @milestone = @project.milestones.new(milestone_params)
      if @milestone.save
        redirect_to @project
      else
        render 'new'
      end
    end

    def update
      @project = Project.find(params[:project_id])
      @milestone = @project.milestones.find(params[:id])

      if @milestone.update_attributes(milestone_params)
        redirect_to @project
      end
    end

    def destroy
      @project = Project.find(params[:project_id])
      @project.milestones.find(params[:id]).destroy
      redirect_to @project
    end


  private

      def milestone_params
        params.require(:milestone).permit(:name, :person_responsible, :description,
                                     :completed)
      end
  end
