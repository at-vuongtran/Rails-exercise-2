class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :name, null: false
      t.integer :gender, null: false
      t.integer :comments_count, null: false

      t.timestamps
    end
  end
end
