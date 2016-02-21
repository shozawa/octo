class PasswordResetsController < ApplicationController
  before_action :get_user,   only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "メールを送信しました。メールを確認しパスワード変更の手続きを進めてください。"
      redirect_to root_url
    else
      flash.now[:danger] = "入力されたメールアドレスは、登録されていません。"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password,  "パスワードが空欄です")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "パスワードを再設定しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      unless (@user && @user.activated? &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # 再設定用トークンが期限切れかどうかを確認する
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "パスワード再設定の有効期限が切れました。再度、再設定の手続きをしてください。"
        redirect_to new_password_reset_url
      end
    end
end
