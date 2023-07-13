class AddNoteToTrashNote < ActiveRecord::Migration[5.2]
  def change
    add_reference :trash_notes, :note, foreign_key: true
  end
end
