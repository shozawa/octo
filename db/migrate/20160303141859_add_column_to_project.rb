class AddColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :owner_id, :integer
  end
end
