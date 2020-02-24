class AddColumnPasswordToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :password, :string, default: "abcd1234"
  end

  def down
    remove_column :users, :password
  end
end
