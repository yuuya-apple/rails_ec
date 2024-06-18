# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_details, dependent: :destroy
end
