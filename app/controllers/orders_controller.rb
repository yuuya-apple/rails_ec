class OrdersController < ApplicationController
  def create
    cart_details = @cart.cart_details.eager_load(:item)

    redirect_to(cart_path, notice: 'カートが空です') if cart_details.blank?

    order = Order.new(order_params)
    order.save

    detail = order.order_details

    cart_details.each do |c|
      detail = order.order_details.new
      detail.item_name = c.item.name
      detail.item_price = c.item.price
      detail.quantity = c.quantity
      detail.save
    end

    @cart.destroy

    redirect_to(root_path, notice: '購入ありがとうございます')
  end

  private

  def order_params
    params.require(:order).permit(Order.column_names.map(&:to_sym))
  end
end
