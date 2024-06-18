# frozen_string_literal: true

class CreateCartDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_details do |t|
      t.references :cart, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity, default: 0, null: false
      t.timestamps
    end
  end
end
