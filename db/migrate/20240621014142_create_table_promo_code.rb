# frozen_string_literal: true

class CreateTablePromoCode < ActiveRecord::Migration[7.0]
  def change
    create_table :promo_codes do |t|
      t.string :discount_code, default: '', null: false, limit: 7
      t.integer :discount_price, default: 0, null: false
      t.boolean :is_used, default: false, null: false

      t.timestamps
    end
  end
end
