class SubjectsController < ApplicationController
  # before_action :set_subject, except: [:index, :create, :new]
  def index
    @subjects = Subject.not_deleted
  end
  def new
    @subject = current_user.subjects.new
  end
  def create
    @subject = current_user.subjects.new(subjects_param)
    if @subject.save
      redirect_to user_subjects_path(current_user)
    else
      render "new"
    end
  end
  def show
    @subject = current_user.subjects.find(params[:id])
    @students = @subject.students.not_deleted
  end
  private
    def set_subject
    end
    def subjects_param
      params.require(:subject).permit(:course_code, :course_id, :section)
    end
end
