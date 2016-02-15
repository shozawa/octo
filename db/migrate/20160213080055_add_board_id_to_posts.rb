class AddBoardIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :board, index: true, foreign_key: true
  end
end
