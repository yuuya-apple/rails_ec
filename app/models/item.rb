# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :cart_details, dependent: :destroy

  has_one_attached :image
end
