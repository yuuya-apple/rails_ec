# frozen_string_literal: true

class AddColumnOrderPromoCode < ActiveRecord::Migration[7.0]
  def up
    change_table :orders, bulk: true do |t|
      t.string :discount_code, default: '', null: false, limit: 7
      t.integer :discount_price, default: 0, null: false
    end
  end

  def dwon
    change_table :orders, bulk: true do |t|
      t.remove :discount_code
      t.remove :discount_price
    end
  end
end
