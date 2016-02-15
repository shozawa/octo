class Version < ActiveRecord::Base
  belongs_to :document
  has_many :posts
end
