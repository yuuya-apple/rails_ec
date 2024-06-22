# frozen_string_literal: true

class CartsController < ApplicationController
  skip_before_action :cart_size, only: [:show]

  def show
    @cart_details = @cart.cart_details.eager_load(:item)
    @cart_size =  @cart_details.sum(&:quantity)
    @promo_code = PromoCode.find_by(discount_code: @cart.discount_code)
  end

  def update
    promo_code = PromoCode.find_by(discount_code: cart_params[:discount_code])
    redirect_to(cart_path, notice: '存在しないコードです') and return if promo_code.nil?
    redirect_to(cart_path, notice: '使用済みコードです') and return if promo_code.is_used?

    @cart.discount_code = promo_code.discount_code
    @cart.save

    redirect_to cart_path, notice: 'プロモーションを適応しました'
  end

  private

  def cart_params
    params.require(:cart).permit(:discount_code)
  end
end
