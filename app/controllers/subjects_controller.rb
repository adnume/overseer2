class SubjectsController < ApplicationController
  # before_action :set_subject, except: [:index, :create, :new]
  def index
    @subjects = Subject.not_deleted
  end
  def new
    @subject = current_user.subjects.new
    @user = current_user
  end
  def create
    @subject = current_user.subjects.new(subjects_param)
    if @subject.save
      redirect_to dashboard_path(current_user)
    else
      render "new"
    end
  end
  def edit
    @subject = current_user.subjects.find(params[:id])
  end

  def update
    @subject = current_user.subjects.find(params[:id])
    if @subject.update_attributes subjects_param
        redirect_to dashboard_path(current_user)
      else
        render "edit"
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
      params.require(:subject).permit(:course_code, :course_name, :section)
    end
end
