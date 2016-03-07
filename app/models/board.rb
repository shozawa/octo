# == Schema Information
#
# Table name: boards
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  boardable_id   :integer
#  boardable_type :string
#

class Board < ActiveRecord::Base
  has_many :posts
  belongs_to :boardable, polymorphic: true
end
