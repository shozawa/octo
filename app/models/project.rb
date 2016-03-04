# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ActiveRecord::Base
  has_many :documents
  has_many :project_users, :dependent => :delete_all
  has_many :users, :through => :project_users
  accepts_nested_attributes_for :project_users

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
