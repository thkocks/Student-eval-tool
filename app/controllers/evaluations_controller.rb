class EvaluationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @evaluations = Evaluation.all
  end

  def show
    @evaluation = Evaluation.find(params[:id])
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)

    if @evaluation.save
      redirect_to batches_path, notice: "Evaluation created"
    else
      render 'new'
    end
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    @evaluation = Evaluation.find(params[:id])

    if @evaluation.update_attributes(evaluation_params)
      redirect_to @evaluation, notice: "Evaluation updated"
    else
      render 'edit'
    end
  end

  def destroy
    @evaluation = Evaluation.find(params[:id])

    @evaluation.destroy

    redirect_to batches_path, notice: "Evaluation deleted"
  end

  def evaluation_params
    params
      .require(:evaluation)
      .permit(
        :date, :color, :remark
      )
  end
end
