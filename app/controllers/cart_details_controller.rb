# frozen_string_literal: true

class CartDetailsController < ApplicationController
  def update
    cart_detail = @cart.cart_details.find_or_initialize_by(item_id: cart_detail_params[:item_id])
    cart_detail.quantity += cart_detail_params[:quantity].nil? ? 1 : cart_detail_params[:quantity].to_i
    cart_detail.save

    redirect_to root_path
  end

  def destroy
    CartDetail.destroy(params[:id])
    redirect_to @cart
  end

  private

  def cart_detail_params
    params.permit(:item_id, :quantity)
  end
end
