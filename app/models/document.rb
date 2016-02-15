class Document < ActiveRecord::Base
  validates :name, presence: true
  has_one :board, as: :boardable, dependent: :destroy
  has_many :versions
  has_many :posts, through: :versions    
end
