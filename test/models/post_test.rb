require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(content: "test", version_id: 1)
  end
  test "正しくpostが作成される" do
    @post.valid?
  end
end
