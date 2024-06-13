class Admin::ItemsController < ApplicationController

  before_action:admin_require


  def index
    @items = Item.all
  end

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
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update!(item_params)
    redirect_to(admin_item_path, notice: "商品を更新しました。")
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to(admin_item_path, notice: "商品を削除しました。")
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:description,:image)
  end
end
