class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    set_item
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @record_address = RecordAddress.new
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
