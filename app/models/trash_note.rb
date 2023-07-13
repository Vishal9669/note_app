class TrashNote < ApplicationRecord
  belongs_to :note
  scope :within_30_days, -> { where("deleted_at >= ?", 30.days.ago) }
end
