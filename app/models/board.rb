class Board < ActiveRecord::Base
  has_many :posts
  belongs_to :boardable, polymorphic: true
end
