class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  before_action :set_batch

  def index
    batch = Batch.find(params[:batch_id])
    @students = batch.students
  end

  def show
    batch = Batch.find(params[:batch_id])
    @student = batch.students.find(params[:id])
  end

  def new
    batch = Batch.find(params[:batch_id])
    @student = batch.students.build
  end

  def create
    batch = Batch.find(params[:batch_id])
    @student = batch.students.create(student_params)
    if @student.save
      redirect_to([@student.batch, @students_path])
    else
      render :new
    end
  end

  def edit
    batch = Batch.find(params[:batch_id])
    @student = batch.students.find(params[:id])
  end

  def update
    batch = Batch.find(params[:batch_id])
    @student = batch.students.find(params[:id])
    if @student.update(student_params)
      redirect_to([@student.batch, @students_path])
    else
      render :edit
    end
  end

  def destroy
    batch = Batch.find(params[:batch_id])
    @student = batch.students.find(params[:id])
    @student.destroy
    redirect_to([@student.batch, @students_path])
  end

  private

  def set_batch
    @batch = Batch.find(params[:batch_id])
  end

  def set_student
    # batch = Batch.find(params[:batch_id])
    # @student = batch.students.find(params[:id])
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
