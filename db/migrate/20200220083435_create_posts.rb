class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :users, null: false
      t.string :title, null: false
      t.string :content, null: false
      t.integer :comments_count, null: false

      t.timestamps
    end
  end
end
