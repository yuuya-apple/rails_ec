# frozen_string_literal: true

class CartDetailsController < ApplicationController
  def index
    @cart_details = cart_initialize
    return unless @cart_details

    items = Item.where(id: @cart_details.map(&:item_id).uniq)

    @cart_details.each do |d|
      item = items.find { |i| d.item_id == i.id }
      d.item_name = item.nil? ? '削除済の商品' : item.name
      d.item_price = item.nil? ? 0 : item.price
    end
  end

  def update
    cart = cart_initialize
    cart_detail = cart.find { |d| d.item_id == params[:id].to_i }
    if cart_detail.nil?
      cart_detail = CartDetail.new
      cart << cart_detail
    end
    cart_detail.item_id = params[:id]
    cart_detail.quantity += params[:quantity].to_i

    session[:cart] = cart
  end

  def destroy
    cart = cart_initialize
    detail_index = cart.find_index { |d| d.item_id == params[:id].to_i }
    cart.delete_at(detail_index)

    session[:cart] = cart

    redirect_to(cart_path)
  end

  # 仮API
  def checkout # rubocop:disable Hc/RailsSpecificActionName
    session.delete(:cart)
  end

  private

  def cart_detail_params; end
end
