require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  def setup
    @document = Document.new
    @document.board = Board.new
  end

  test "ドキュメントには投稿可能な掲示板機能がついてる" do
    assert_not @document.board.nil?
    post = @document.board.posts.build
    post.content = 'Hello, world!'
    assert @document.valid?
  end
end
