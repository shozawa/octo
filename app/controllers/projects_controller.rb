class ProjectsController < ApplicationController
  def index
    @user = User.find(current_user)
    @projects = Project.all
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @project_users = ProjectUser.where(project_id: params[:id])
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

  def destroy
    Project.find_by(params[:id]).destroy
    redirect_to projects_path
    flash[:notice] = "削除しました"
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end
end
