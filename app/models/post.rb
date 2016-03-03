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
#
# Indexes
#
#  index_posts_on_board_id    (board_id)
#  index_posts_on_version_id  (version_id)
#

class Post < ActiveRecord::Base
  belongs_to :version
  validates :content, presence: true
  validates :version_id, presence: true
  self.per_page = 3
end
