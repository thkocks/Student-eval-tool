class RemarksController < ApplicationController
  before_action :set_remark, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def show; end

  def new
    @remark = Remark.new
  end

  def create
    @remark = Remark.new(remark_params)
    if @remark.save
      redirect_to @remark, notice: "Remark created"
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @Remark.update(remark_params)
      redirect_to @remark, notice: "Remark updated"
    else
      render :edit
    end
  end

  private

  def set_remark
    @remark = Remark.find(params[:id])
  end

  def remark_params
    params
      .require(:remark)
      .permit(
        :notice
      )
  end
end
