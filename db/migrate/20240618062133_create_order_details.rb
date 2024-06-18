class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.references :order, foreign_key: true
      t.string :item_name, null: false
      t.float :item_price, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
