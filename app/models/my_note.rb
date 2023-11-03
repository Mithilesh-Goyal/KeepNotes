class MyNote < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  scope :with_deleted, -> { where.not(deleted_at: nil) }

  def delete
    self.deleted_at = DateTime.now
    save
  end
end
