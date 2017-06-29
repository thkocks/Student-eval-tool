class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    student = Student.find(params[:student_id])
    @evaluations = student.evaluations
  end

  def show
    student = Student.find(params[:student_id])
    @evaluation = student.evaluations.find(params[:id])
  end

  def new
    student = Student.find(params[:student_id])
    @evaluation = student.evaluations.build
  end

  def create
    student = Student.find(params[:student_id])
    @evaluation = student.evaluations.create(evaluation_params)
    if @evaluation.save
      redirect_to([@evaluation.student, @evaluations_path])
    else
      render "new"
    end
  end

  def edit
    student = Student.find(params[:student_id])
    @evaluation = student.evaluations.find(params[:id])
  end

  def update
    student = Student.find(params[:student_id])
    @evaluation = student.evaluations.find(params[:id])
    if @evaluation.update(evaluation_params)
      redirect_to([@evaluation.student, @evaluations_path])
    else
      render :edit
    end
  end

  def destroy
    student = Student.find(params[:student_id])
    @evaluation = student.evaluations.find(params[:id])
    @evaluation.destroy
    redirect_to([@evaluation.student, @evaluations_path])
  end

  private

  def set_evaluation
    student = Student.find(params[:student_id])
    @evaluation = student.evaluations.find(params[:id])
  end

  def evaluation_params
    params
      .require(:evaluation)
      .permit(
        :date, :color, :remark
      )
  end
end
