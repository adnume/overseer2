module AttendancesHelper
  def status student, meeting
    student.find_attendance(meeting).status.titleize rescue "Absent"
  end
end
