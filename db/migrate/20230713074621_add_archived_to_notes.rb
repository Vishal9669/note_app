class AddArchivedToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :archived, :boolean
  end
end
