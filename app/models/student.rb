class Student < ApplicationRecord
  has_many :attendances
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
end
