class Note < ApplicationRecord
  has_and_belongs_to_many :labels
  has_one_attached :image

  validate :reminder_cannot_be_in_the_past
  def reminder_cannot_be_in_the_past
    errors.add(:reminder_date, "can't be in the past") if reminder.present? && reminder < Date.today
  end

  COLOR_TYPE = { "White" => 'White',"Red" => '#7c0a02', "Green" => '#004225', "Pista-Green"  => '#d6c675' , "AntiqueWhite"  => '#faebd7' , "Blue Bell"  => '#a2a2d0' }.freeze

  scope :active, -> { where(status:"active") }
  scope :archived, -> { where(status:"archived") }
  scope :notdel, -> { where(stage:"notdel") }
  scope :del, -> { where(stage:"del") }
  scope :pinned, -> { where(pin: true) }
  scope :unpinned, -> { where(pin: false) }

  def formatted_date
    updated_at.strftime('%d-%b-%y')
  end
  def formatted_time
    updated_at.localtime.strftime("%H:%M:%S")
  end
end
