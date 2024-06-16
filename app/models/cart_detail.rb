# frozen_string_literal: true

class CartDetail
  attr_accessor :item_id, :item_name, :item_price, :quantity

  def initialize(hash = nil)
    unless hash.nil?
      self.item_id = hash['item_id'].to_i
      self.quantity = hash['quantity'].to_i
    end

    self.quantity = 0 if quantity.nil?
  end
end
