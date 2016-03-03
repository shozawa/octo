# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#
# Indexes
#
#  index_documents_on_project_id  (project_id)
#

class Document < ActiveRecord::Base
  validates :name, presence: true
  validates :project_id, presence: true
  has_one :board, as: :boardable, dependent: :destroy
  has_many :versions
  has_many :posts, through: :versions
  belongs_to :project
  accepts_nested_attributes_for :versions
end
