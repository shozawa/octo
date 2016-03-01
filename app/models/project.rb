class Project < ActiveRecord::Base
  has_many :documents
  has_many :project_users, dependent: :destroy
  has_many :users, :through => :project_users

  #プロジェクトに追加
  def memberAdd(selected_user)
    project_users.create(user_id: selected_user.id)
  end

  #プロジェクトから除外
  def memberReject(selected_user)
    project_users.find_by(user_id: selected_user.id).destroy
  end

  #FIXME
  def isMember?(selected_user)
    users.include?(selected_user)
  end

end
