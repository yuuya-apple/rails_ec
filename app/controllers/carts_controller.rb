# frozen_string_literal: true

class CartsController < ApplicationController
  def destroy
    session.delete(CART_ID)
    redirect_to root_path
  end
end
