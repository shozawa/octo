class Document < ActiveRecord::Base
  validates :name, presence: true
  validates :project_id, presence: true
  has_one :board, as: :boardable, dependent: :destroy
  has_many :versions
  has_many :posts, through: :versions
  belongs_to :project
  accepts_nested_attributes_for :versions
end
