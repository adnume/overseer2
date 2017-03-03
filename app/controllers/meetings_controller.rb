class MeetingsController < ApplicationController
  before_action :set_subject, only: [:index, :create, :new]
  def index
    @meetings = @subject.meetings.not_deleted
  end
  def new
    @meeting = @subject.meetings.create
    redirect_to subject_meetings_path(@subject)
  end
  # def create
  #   @meeting = @subject.meetings.new(meetings_param)
  #   if @meeting.save
  #     redirect_to subject_meetings_path(@subject)
  #   else
  #     render "new"
  #   end
  # end
  def show
    @meeting = @subject.meetings.find(params[:id])
    # @meetings = @meeting.meetings.not_deleted
  end
  private
    def set_subject
      @subject = Subject.not_deleted.find(params[:subject_id])
    end
    def meetings_param
        params.require(:meeting).permit(:meeting_type)
      end
end
