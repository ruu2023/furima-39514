class ItemsController < ApplicationController

  def index
  end

  def new
    unless user_signed_in?
      redirect_to root_path # ログインしていない場合、root_pathへリダイレクト
    end
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :charge_id, :prefecture_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

end
