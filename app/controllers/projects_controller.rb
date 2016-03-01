class ProjectsController < ApplicationController
  def index
    @user = User.find(current_user)
    @projects = Project.all
    @project = Project.new
  end

  def show
    @projects = Project.all
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_documents_path(@project)
    else
      render 'new'
    end
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end
end
