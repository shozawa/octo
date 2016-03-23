class ProjectUserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_user_mailer.add_user.subject
  #
  def add_user(user,project)
    @user = user
    @project = project
    project_name = @project.name
    mail to: user.email, subject: "【Octo】プロジェクト[#{project_name}]に追加されました"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_user_mailer.reject_user.subject
  #
  def reject_user(user,project)
    @user = user
    @project = project
    project_name = @project.name
    mail to: user.email, subject: "【Octo】プロジェクト[#{project_name}]から除外されました"
  end
end
