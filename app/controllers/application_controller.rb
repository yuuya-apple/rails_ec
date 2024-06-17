# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :cart_size

  CART_ID = :cart_id

  private

  def cart_size
    @cart_size = session[CART_ID].nil? ? 0 : Cart.find(session[CART_ID]).cart_details.sum(&:quantity)
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'pw'
    end
  end
end
