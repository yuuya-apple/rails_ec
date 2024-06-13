class AddColItemsDesc < ActiveRecord::Migration[7.0]
  def change
    add_column :items,:description,:string,default:"",null:false
  end
end
