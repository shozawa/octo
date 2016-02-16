class AddProjectIdToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :project, index: true, foreign_key: true
  end
end
