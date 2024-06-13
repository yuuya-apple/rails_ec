class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_one_attached :image
end