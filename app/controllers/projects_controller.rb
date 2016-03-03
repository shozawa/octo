class ProjectsController < ApplicationController
  before_action :is_member?, only: [:show]
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
      @created_project = Project.last
      p_id = @created_project.id
      u_id = @created_project.owner_id
      ProjectUser.create(project_id: p_id, user_id: u_id)
      redirect_to project_documents_path(@project)
      flash[:notice] = "プロジェクト「#{@created_project.name}」を作成しました"
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
      params.require(:project).permit(:name, :owner_id)
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
