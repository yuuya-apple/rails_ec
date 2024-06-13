# frozen_string_literal: true

class ItemAddColumSellerId < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :seller, foreign_key: { to_table: :users }
  end
end
