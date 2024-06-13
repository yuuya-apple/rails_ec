# frozen_string_literal: true

class ItemsChangeColNamePriceDes < ActiveRecord::Migration[7.0]
  def up
    change_column :items, bulk: true do |c|
      c.string :name, default: '', null: false
    end
    change_column :items, :price, :float, default: 0, null: false
  end

  def douwn
    change_column :items, :name, :string
    change_column :items, :price, :float
  end
end
