class ItemsChangeColDes < ActiveRecord::Migration[7.0]
  def change
    remove_column :items,:description
  end
end
