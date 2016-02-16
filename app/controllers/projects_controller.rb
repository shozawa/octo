class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end

  def show
    @project = Project.find_by(id: params[:project_id])
  end

  def new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
    else
    end
    redirect_to projects_documents_path
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end
end
