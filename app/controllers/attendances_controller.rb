class AttendancesController < ApplicationController
  before_action :set_meeting, only: [:index, :create, :new]
  def index
    @attendances = @meeting.attendances.not_deleted
    @students = @meeting.subject.students
  end

  def new
    @attendance = @meeting.attendances.create
    redirect_to meeting_attendances_path(@meeting)
  end
  # def create
  #   @attendance = @meeting.attendances.new(attendances_param)
  #   if @attendance.save
  #     redirect_to meeting_attendances_path(@meeting)
  #   else
  #     render "new"
  #   end
  # end
  # def show
  #   @attendance = @meeting.attendances.find(params[:id])
  #   # @attendances = @attendance.attendances.not_deleted
  # end
  def toggle
    @student = current_user.students.find(params[:student])
    @meeting = current_user.meetings.find(params[:meeting_id])
    #move this to model
    @attendance = @student.find_attendance(@meeting)
    if @attendance.present?
      puts "---------------present"
      @attendance.toggle

    else
      puts "---------------nil"
      @attendance = @student.attendances.create(meeting_id: @meeting.id)
    end
  end

  private
    def set_meeting
      @meeting = current_user.meetings.not_deleted.find(params[:meeting_id])
    end
    def attendances_param
        params.require(:attendance).permit(:attendance_type)
      end
end
