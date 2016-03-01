class ProjectUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :user_id, presence: true
  validates :project_id, presence: true

  #選択候補のユーザー
  def selectable_users
    User.all
  end

end
