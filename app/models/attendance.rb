class Attendance < ApplicationRecord
  belongs_to :student
  belongs_to :meeting
  def self.not_deleted
    self.all
  end
  def toggle
    s = self.status
    case s
    when "present"
      self.status = "absent"
    when "absent"
      self.status = "late"
    when "late"
      self.status = "excused"
    when "excused"
      self.status = "absent"
    end
    self.save
  end
end
