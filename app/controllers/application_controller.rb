# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_cart, :cart_size

  CART_ID = :cart_id

  private

  def set_cart
    @cart = Cart.find_or_create_by(id: session[CART_ID])
    session[CART_ID] ||= @cart.id
  end

  def cart_size
    @cart_size = @cart.cart_details.sum(&:quantity)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'pw'
    end
  end
end
