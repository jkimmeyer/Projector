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

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end


  def destroy
    Project.find(params[:id]).destroy
    redirect_to root_path
  end

private

    def project_params
      params.require(:project).permit(:name, :person_responsible, :start,
                                   :planned_termination_date)
    end
end
