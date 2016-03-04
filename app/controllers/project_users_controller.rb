class ProjectUsersController < ApplicationController
  before_action :is_member?, only: [:index, :destroy]
  def index
    @project_users = ProjectUser.where(project_id: params[:project_id])
  end

  def new
    @project = Project.find(params[:project_id])
    @project_user = ProjectUser.new
  end

  def create
    @project_user = ProjectUser.new(project_user_params)
    added_project_id = @project_user.project_id
    if @project_user.save
      flash[:notice] = "Successfully created..."
      redirect_to project_project_users_path(added_project_id)
    else
      flash[:notice] = "失敗しました"
      redirect_to project_project_users_path(added_user_id)
    end
  end

  def destroy
    logger.debug(params[:project_id])
    @project_user = ProjectUser.where(project_id: params[:project_id], user_id: params[:id])
    id = @project_user.pluck(:id)
    @project_user.destroy(id)
    redirect_to project_project_users_path
    flash[:notice] = "削除しました"
  end

  private
    def project_user_params
      params.require(:project_user).permit(:project_id, :user_id)
    end

    def is_member?
      id = current_user.id
      user = User.find(id)
      logger.debug(user)
      my_project_ids = user.project_users.pluck(:project_id)
      current_project_id = params[:project_id].to_i
      unless my_project_ids.include?(current_project_id)
        redirect_to projects_path
      end
    end
end
