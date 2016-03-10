# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  version_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_board_id    (board_id)
#  index_posts_on_version_id  (version_id)
#

Kaminari.configure do |config|
  config.page_method_name = :per_page_kaminari
end

class Post < ActiveRecord::Base
  belongs_to :version
  belongs_to :user
  validates :content, presence: true
  validates :version_id, presence: true
  default_scope ->{ order('created_at DESC') }
  paginates_per 10
end
