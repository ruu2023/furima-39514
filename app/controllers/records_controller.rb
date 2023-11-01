class RecordsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @record_address = RecordAddress.new
    set_item
  end

  def new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      set_item
      render :index, status: :unprocessable_entity
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def record_params
    params.require(:record_address).permit(:post_code, :prefecture_id, :municipalities, :block, :apartment, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
