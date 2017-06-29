class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @days = student.days
    # @days = Day.all
  end

  def show; end

  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      redirect_to @day, notice: "Day created"
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @Day.update(day_params)
      redirect_to @day, notice: "Day updated"
    else
      render :edit
    end
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params
      .require(:day)
      .permit(
        :eval, :date
      )
  end
end
