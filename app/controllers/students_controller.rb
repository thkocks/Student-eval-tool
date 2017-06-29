class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @students = batch.students
    # @students = Student.all
  end

  def show; end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "Student created"
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @Student.update(student_params)
      redirect_to @student, notice: "Student updated"
    else
      render :edit
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params
      .require(:student)
      .permit(
        :first_name, :last_name, :photo
      )
  end
end
