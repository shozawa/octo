class ProjectUsersController < ApplicationController
  before_action :is_member?, only: [:index, :destroy]

  def index
    @project_users = ProjectUser.where(project_id: params[:project_id])
  end

  def new
    @user =User.new
    @project = Project.find(params[:project_id])
    @project_user = ProjectUser.new
  end

  def create
    email = params[:email]
    user_exists = User.exists?(email: email)
    project_id = params[:project_id]
    project = Project.find_by(id: project_id)

    #ユーザーがいる場合
    if user_exists
      user = User.find_by(email: email)
      @project_user = ProjectUser.new(project_id: project_id, user_id: user.id)
      if @project_user.save
        flash[:success] = "メンバーに追加しました！"
        redirect_to project_project_users_path(project_id)
        #メンバー追加メール送信
        ProjectUserMailer.add_user(user,project).deliver_later
      else
        flash[:warning] = "失敗しました.すでにメンバーに含まれている可能性があります。"
        redirect_to project_project_users_path(params[:project_id])
      end

    #ユーザーがいない場合
    else
      @user = User.invite!({:name => email,:email => email}, current_user)
      ProjectUser.create!(project_id: project_id, user_id: @user.id)
      flash[:warning] = "#{email}さんは未登録ユーザーです。招待を送信しました。"
      redirect_to project_project_users_path(params[:project_id])
    end
  end

  def destroy
    @project_user = ProjectUser.where(project_id: params[:project_id], user_id: params[:id])
    id = @project_user.pluck(:id)
    @project_user.destroy(id)
    redirect_to project_project_users_path
    flash[:alert] = "削除しました"

    #メンバー除外メール送信
    user = User.find(params[:id])
    project = Project.find(params[:project_id])
    ProjectUserMailer.reject_user(user,project).deliver_later
  end

  private
    def is_member?
      id = current_user.id
      user = User.find(id)
      my_project_ids = user.project_users.pluck(:project_id)
      current_project_id = params[:project_id].to_i
      unless my_project_ids.include?(current_project_id)
        redirect_to projects_path
      end
    end
end
