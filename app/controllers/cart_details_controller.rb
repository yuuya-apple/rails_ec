# frozen_string_literal: true

class CartDetailsController < ApplicationController
  skip_before_action :cart_size, only: [:index]

  def index
    @cart_details = session[CART_ID].nil? ? [] : Cart.find(session[CART_ID]).cart_details
    @cart_size =  @cart_details.sum(&:quantity)
  end

  def update
    if session[CART_ID].nil?
      cart = Cart.new
      cart.save
      session[CART_ID] = cart.id
    end

    request = CartDetail.new(cart_detail_params)

    cart_detail = CartDetail.find_by(cart_id: session[CART_ID], item_id: request.item_id)

    if cart_detail.nil?
      cart_detail = request
      cart_detail.cart_id = session[CART_ID]
    else
      cart_detail.quantity += request.quantity
    end

    cart_detail.save

    redirect_to root_path
  end

  def destroy
    CartDetail.destroy(params[:id])
    redirect_to cart_path
  end

  private

  def cart_detail_params
    logger.debug("調査ログ：#{params}")

    params.require(:cart_detail).permit(:item_id, :quantity)
  end
end
