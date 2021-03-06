class BatchesController < ApplicationController
  before_action :set_batch, only: [:show, :edit, :update, :delete]
  before_action :authenticate_user!, except: [:show]

  def index
    @batches = Batch.all
  end

  def show; end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)
    if @batch.save
      redirect_to @batch, notice: "Batch created"
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @Batch.update(batch_params)
      redirect_to @batch, notice: "Batch updated"
    else
      render :edit
    end
  end

  def destroy
    @batch = Batch.find(params[:id])
      if @batch.present?
        @batch.destroy
      end
    redirect_to root_path
  end

  private

  def set_batch
    @batch = Batch.find(params[:id])
  end

  def batch_params
    params
      .require(:batch)
      .permit(
        :number, :start_date, :end_date
      )
  end
end
