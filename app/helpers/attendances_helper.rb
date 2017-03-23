module AttendancesHelper
  def status student, meeting
    student.find_attendance(meeting).status.titleize rescue "Absent"
  end
  def attendance_class student, meeting
    case (student.find_attendance(meeting).status.titleize rescue "Absent")
    when "Absent"
      return "btn red"
    when "Present"
      return "btn green"
    when "Late"
      return "btn yellow"
    when "Excused"
      return "btn blue"
    end
  end
end
