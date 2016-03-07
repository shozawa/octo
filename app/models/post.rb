class Post < ActiveRecord::Base
  belongs_to :version
  validates :content, presence: true
  validates :version_id, presence: true
  default_scope ->{ order('created_at DESC') }
  paginates_per 10
end
