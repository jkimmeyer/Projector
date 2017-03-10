class ProjectsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]

  def index
    @projects = Project.all.paginate(page: params[:page])
  end

  def new
    @project = Project.new
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
      redirect_to @project
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
      params.require(:project).permit(:name, :person_responsible, :project_start_date, :planned_termination_date, :description)
    end
end
