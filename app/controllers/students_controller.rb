class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index

    @students = Student.all.chronological
    @students2 = Student.order("RANDOM()")
  end

  def show
    @student = Student.find(params[:id])
    @assessments = @student.assessments
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: "Student created"
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(student_params)
      redirect_to @student, notice: "Student updated"
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])

    @student.destroy

    redirect_to students_path, notice: "Student deleted"
  end

  private

  def student_params
    params
      .require(:student)
      .permit(
        :first_name, :last_name, :photo
      )
  end
end
