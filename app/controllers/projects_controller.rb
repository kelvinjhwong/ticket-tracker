class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.first
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    flash[:notice] = 'Project was successfully destroyed.'

    redirect_to projects_path
  end
end