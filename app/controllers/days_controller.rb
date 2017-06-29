class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    student = Student.find(params[:student_id])
    @days = student.days
  end

  def show
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
  end

  def new
    student = Student.find(params[:student_id])
    @day = student.days.build
  end

  def create
    student = Student.find(params[:student_id])
    @day = student.days.create(params[:day])
    if @day.save
      redirect_to([@day.student, @day])
    else
      render "new"
    end
  end

  def edit
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
  end

  def update
    if @Day.update(day_params)
      redirect_to([@day.student, @day])
    else
      render :edit
    end
  end

  def destroy
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
    @day.destroy
  end

  private

  def set_day
    student = Student.find(params[:student_id])
    @day = student.days.find(params[:id])
  end

  def day_params
    params
      .require(:day)
      .permit(
        :eval, :date
      )
  end
end
