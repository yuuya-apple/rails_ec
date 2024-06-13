# frozen_string_literal: true

class DeleteRelationItemUser < ActiveRecord::Migration[7.0]
  def change
    remove_reference :items, :seller, foreign_key: { to_table: :users }
  end
end
