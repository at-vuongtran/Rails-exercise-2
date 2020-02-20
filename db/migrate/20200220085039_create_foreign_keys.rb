class CreateForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :teams, :users, column: :leader_id
  end
end
