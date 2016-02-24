class Post < ActiveRecord::Base
  belongs_to :version
  validates :content, presence: true
  validates :version_id, presence: true
  self.per_page = 3
end
