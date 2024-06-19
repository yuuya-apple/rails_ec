# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :firstname, defult: '', null: false
      t.string :lastname, defult: '', null: false
      t.string :username, defult: '', null: false
      t.string :email, defult: '', null: false
      t.string :address, defult: '', null: false
      t.string :address2, defult: '', null: false
      t.string :country, defult: '', null: false
      t.string :state, defult: '', null: false
      t.string :zip, defult: '', null: false
      t.boolean :is_same_address, defult: false, null: false
      t.boolean :is_save_info, defult: false, null: false
      t.string :name_on_card, defult: '', null: false
      t.integer :credit_card_number, default: 0, null: false
      t.integer :expiration, default: 0, null: false
      t.integer :cvv, default: 0, null: false

      t.timestamps
    end
  end
end
