class Note < ApplicationRecord
  has_one :trash_note
  before_create :set_archived
  scope :deleted, -> { where(deleted: true) }

  def move_to_trash
    update(deleted: true, deleted_at: Time.now)
  end

  private

  def set_archived
    self.archived = false
  end
end
