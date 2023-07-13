class CreateTrashNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :trash_notes do |t|
      t.string :title
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
