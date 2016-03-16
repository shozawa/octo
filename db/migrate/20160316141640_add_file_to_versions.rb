class AddFileToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :file, :string
  end
end
