# frozen_string_literal: true

class OrdersController < ApplicationController
  skip_before_action :cart_size, only: :create
  before_action :basic_auth, only: %i[index show]

  def index
    @orders = Order.all.eager_load(:order_details)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    cart_details = @cart.cart_details.eager_load(:item)
    redirect_to(@cart, notice: 'カートが空です') and return if cart_details.blank?

    create_proc(cart_details)

    redirect_to(root_path, notice: '購入ありがとうございます')
  end

  private

  def create_proc(cart_details)
    @cart.transaction do
      promo_code = PromoCode.find_by(discount_code: @cart.discount_code)
      order = Order.new(order_params)

      if promo_code.present?
        promo_code.is_used = true
        promo_code.save
        order.discount_code = promo_code&.discount_code
        order.discount_price = promo_code&.discount_price
      end

      order.save

      cart_details.each do |d|
        detail = order.order_details.new
        detail.item_name = d.item.name
        detail.item_price = d.item.price
        detail.quantity = d.quantity
        detail.save
      end

      @cart.destroy

      OrderMailer.with(order:).welcome_email.deliver_now
    end
  end

  def order_params
    params.require(:order).permit(Order.column_names.map(&:to_sym))
  end
end
