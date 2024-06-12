class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_digest, null: false
      t.boolean :is_admin

      t.timestamps
      t.index :name, unique: true
    end
  end
end
