class ProjectUsersController < ApplicationController

  def index
    @user = User.find(current_user)
    @users = User.all
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
    ProjectUser.find_by(user_id: params[:id]).destroy
    redirect_to project_project_users_path
    flash[:notice] = "削除しました"
  end

  private
    def project_user_params
      params.require(:project_user).permit(:project_id, :user_id)
    end
end
