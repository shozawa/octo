# == Schema Information
#
# Table name: project_users
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_project_users_on_project_id  (project_id)
#  index_project_users_on_user_id     (user_id)
#

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
