class ProjectUsersController < ApplicationController

  def index
    @user = User.find(current_user)
  end

  def create
    @member = user.project_user.build(project_user_params)
    if @member.save
      flash[:notice] = "Successfully created..."
    else
      flash[:notice] = "失敗"
    end
  end

  def destroy
  end

  private
    def project_user_params
      params.require(:project_user).permit(:user_id)
    end
end
