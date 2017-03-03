class Meeting < ApplicationRecord
  belongs_to :subject
  has_many :attendances
  def self.not_deleted
    self.all
  end
  def meeting
    self.created_at.strftime("%B %d, %Y, %I:%M %P")
  end
end
