class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @evaluations = Evaluation.all
  end

  def show; end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to @evaluation, notice: "Evaluation created"
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @Evaluation.update(evaluation_params)
      redirect_to @evaluation, notice: "Evaluation updated"
    else
      render :edit
    end
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params
      .require(:evaluation)
      .permit(
        :date, :color, :remark
      )
  end
end
