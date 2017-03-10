class MilestonesController < ApplicationController
  before_action :load_project
  before_action :authenticate_user!, only:[:new, :edit, :destroy]

    def new
      @milestone = @project.milestones.new()  
    end

    def edit
      @milestone = @project.milestones.find(params[:id])
    end

    def create
      @milestone = @project.milestones.new(milestone_params)
      if @milestone.save
        redirect_to @project
      else
        render 'new'
      end
    end

    def update
      @milestone = @project.milestones.find(params[:id])
      if @milestone.update_attributes(milestone_params)
        redirect_to @project
      else
        render 'edit'
      end
    end

    def destroy
      @project.milestones.find(params[:id]).destroy
      redirect_to @project
    end


  private

      def load_project
        @project = Project.find(params[:project_id])
      end

      def milestone_params
        params.require(:milestone).permit(:name, :person_responsible, :description,
                                     :completed)
      end
  end
