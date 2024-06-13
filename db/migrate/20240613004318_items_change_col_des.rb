# frozen_string_literal: true

class ItemsChangeColDes < ActiveRecord::Migration[7.0]
  def up
    remove_column :items, :description
  end

  def douwn
    add_column :items, :description, :string
  end
end
