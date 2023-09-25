class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end
