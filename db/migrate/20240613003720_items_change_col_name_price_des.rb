class ItemsChangeColNamePriceDes < ActiveRecord::Migration[7.0]
  def change
    change_column :items,:name,:string,default:"",null:false
    change_column :items,:price,:float,default:0,null:false
  end

end
