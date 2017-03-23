class Student < ApplicationRecord
  has_many :attendances
  belongs_to :subject
  validates_presence_of :first_name, :last_name
  def self.not_deleted
    self.all
  end
  def find_attendance meeting
    self.attendances.find_by_meeting_id(meeting.id)
  end
  # def find_or_create_attendance meeting
  #   attendance = self.attendances.find_by_meeting_id meeting.id
  #   if attendance
  #     attendance.
  #   end
  # end
  def name
    "#{self.first_name} #{self.middle_name} #{self.last_name} #{self.suffix}"
  end
  def name_reversed
    "#{self.last_name}, #{(self.first_name + ' ') rescue ''}#{(self.middle_name.first.upcase + ' ') rescue ''}"
  end
end
