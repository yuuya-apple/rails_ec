# frozen_string_literal: true

class UserIsadminNotMil < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :is_admin, :boolean, default: false, null: false
  end

  def douwn
    change_column :users, :is_admin, :boolean
  end
end
