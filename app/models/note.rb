class Note < ApplicationRecord
  has_one :trash_note
  scope :active, -> { where(deleted: false) }
  scope :deleted, -> { where(deleted: true) }

  def move_to_trash
    update(deleted: true, deleted_at: Time.now)
  end
end
