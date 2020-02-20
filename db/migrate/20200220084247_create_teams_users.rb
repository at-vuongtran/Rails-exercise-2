class CreateTeamsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :teams_users do |t|
      t.references :teams, null: false
      t.references :users, null: false

      t.timestamps
    end
  end
end
