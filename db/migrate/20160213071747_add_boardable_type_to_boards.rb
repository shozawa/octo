class AddBoardableTypeToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :boardable_id, :integer
    add_column :boards, :boardable_type, :string
  end
end
