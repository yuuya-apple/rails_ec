# frozen_string_literal: true

class AddColumnCartsPromoCode < ActiveRecord::Migration[7.0]
  def up
    change_table :carts do |t|
      t.string :discount_code, default: '', null: false, limit: 7
    end
  end

  def down
    change_table :carts do |t|
      t.remove :discount_code
    end
  end
end
