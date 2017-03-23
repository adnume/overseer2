class StudentsController < ApplicationController
  before_action :set_subject, only: [:index, :create, :new]
  def index
    @students = @subject.students.not_deleted
  end
  def new
    @student = @subject.students.new
  end
  def create
    @student = @subject.students.new(students_param)
    if @student.save
      redirect_to subject_students_path(@subject)
    else
      render "new"
    end
  end
  def edit
    @student = Student.find(params[:id])
  end
  def update
    @student = Student.find(params[:id])
    subject = @student.subject

    if @student.update_attributes(students_param)
      redirect_to subject_students_path(subject)
    else
      render "new"
    end
  end
  def show
    @student = @subject.students.find(params[:id])
    # @students = @student.students.not_deleted
  end
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to :back
  end
  private
    def set_subject
      @subject = Subject.not_deleted.find(params[:subject_id])
    end
    def students_param
      params.require(:student).permit(:id_number, :first_name, :middle_name, :last_name, :suffix)
    end

end
