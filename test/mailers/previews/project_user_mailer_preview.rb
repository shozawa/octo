# Preview all emails at http://localhost:3000/rails/mailers/project_user_mailer
class ProjectUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/project_user_mailer/add_user
  def add_user
    ProjectUserMailer.add_user
  end

  # Preview this email at http://localhost:3000/rails/mailers/project_user_mailer/reject_user
  def reject_user
    ProjectUserMailer.reject_user
  end

end
