class AddVersionIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :version, index: true, foreign_key: true
  end
end
