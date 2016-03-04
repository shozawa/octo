class ProjectsController < ApplicationController
  before_action :is_member?, only: [:show, :destroy]
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
    @project = Project.create!(project_params)
    user_id = current_user.id
    @project_user = ProjectUser.new(project_id: @project.id, user_id: user_id)
    if @project_user.save
      redirect_to project_documents_path(@project)
      flash[:notice] = "プロジェクト「#{@project.name}」を作成しました"
    else
      render 'new'
      flash[:notice] = "失敗したました"
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path
    flash[:notice] = "削除しました"
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end

    def is_member?
      user = User.find(current_user)
      logger.debug(user)
      my_project_ids = user.project_users.pluck(:project_id)
      logger.debug(my_project_ids)
      current_project_id = params[:id].to_i
      unless my_project_ids.include?(current_project_id)
        redirect_to projects_path
      end
    end
end
