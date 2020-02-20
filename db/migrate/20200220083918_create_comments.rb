class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :users, null: false
      t.references :posts, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
