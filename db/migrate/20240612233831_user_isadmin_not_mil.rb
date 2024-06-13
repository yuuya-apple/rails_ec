class UserIsadminNotMil < ActiveRecord::Migration[7.0]

  def change
    execute 'DELETE FROM users'
    change_column :users,:is_admin,:boolean,default: false,null: false
  end
end