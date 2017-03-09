class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new(params[:person])
      if @project.save
        # success
      else
        # error handling
      end
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
  end

private

    def project_params
      params.require(:project).permit(:name, :person_responsible, :start,
                                   :planned_termination_date)
    end
end
