# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :cart_size
  before_action :cart_size

  private

  def cart_size
    @cart_size = cart_initialize&.sum(&:quantity)
  end

  def cart_initialize
    cart = session[:cart]
    cart.nil? ? [] : cart.map { |c| CartDetail.new(c) }
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'pw'
    end
  end
end
