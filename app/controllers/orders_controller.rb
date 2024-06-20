# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :basic_auth, only: %i[index show]
  def index
    @orders = Order.all.eager_load(:order_details)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    cart_details = @cart.cart_details.eager_load(:item)

    redirect_to(cart_path, notice: 'カートが空です') and return if cart_details.blank?

    order = Order.new(order_params)
    order.save

    cart_details.each do |c|
      detail = order.order_details.new
      detail.item_name = c.item.name
      detail.item_price = c.item.price
      detail.quantity = c.quantity
      detail.save
    end

    @cart.destroy

    OrderMailer.with(order:).welcome_email.deliver_now

    redirect_to(root_path, notice: '購入ありがとうございます')
  end

  private

  def order_params
    params.require(:order).permit(Order.column_names.map(&:to_sym))
  end
end
