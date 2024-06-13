class Admin::ItemsController < ApplicationController

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to(items_url,notice:"商品を追加しました")
    else
      render :new,status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:description)
  end
end
