class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show; end

  def new; end

  def create
    Item.new(item_params).save!
    redirect_to(items_url, notice: '商品を登録しました。')
  end

  def edit; end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
