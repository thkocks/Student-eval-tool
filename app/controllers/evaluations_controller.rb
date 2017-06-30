class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update]
  before_action :set_student

  def index
    # student = Student.find(params[:student_id])
    # @evaluations = student.evaluations
    @evaluations = Evaluation.all
  end

  def show
    # student = Student.find(params[:student_id])
    # @evaluation = student.evaluations.find(params[:id])
    @student = Student.find(@evaluation.student_id)
    @evaluation = Evaluation.find(params[:id])
  end

  def new
    # student = Student.find(params[:student_id])
    # @evaluation = student.evaluations.build
    @evaluation = Evaluation.new
  end

  def create
    # student = Student.find(params[:student_id])
    # @evaluation = student.evaluations.create(evaluation_params)
    # if @evaluation.save
    #   redirect_to([@evaluation.student, @evaluations_path])
    # else
    #   render "new"
    # end
    @evaluation = Evaluation.create(evaluation_params)
    @evaluation.student_id = @student.id
    if @evaluation.save
      redirect_to @student.batch, notice: 'Evaluation created.'
    else
      redirect_to @student.batch, notice: 'Error'
  end

  def edit
    # student = Student.find(params[:student_id])
    # @evaluation = student.evaluations.find(params[:id])
    @student = Student.find(@evaluation.student_id)
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    # student = Student.find(params[:student_id])
    # @evaluation = student.evaluations.find(params[:id])
    # if @evaluation.update(evaluation_params)
    #   redirect_to([@evaluation.student, @evaluations_path])
    # else
    #   render :edit
    # end
    @evaluation = Evaluation.update(evaluation_params)
    @evaluation.student_id = @student.id
    if @evaluation.save(evaluation_params)
      redirect_to @student.batch, notice: 'Evaluation updated.'
    else
      redirect_to @student.batch, notice: 'Error'
  end

  def destroy
    # student = Student.find(params[:student_id])
    # @evaluation = student.evaluations.find(params[:id])
    # @evaluation.destroy
    # redirect_to([@evaluation.student, @evaluations_path])
    @evaluation.destroy
    redirect_to @student, notice: 'Evaluation removed.'
  end

  private

  def set_evaluation
    # student = Student.find(params[:student_id])
    # @evaluation = student.evaluations.find(params[:id])
    @evaluation = Evaluation.find(params[:id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  def evaluation_params
    params
      .require(:evaluation)
      .permit(
        :date, :color, :remark
      )
  end
end
