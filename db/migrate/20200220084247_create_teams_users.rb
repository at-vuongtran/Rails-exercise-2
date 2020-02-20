class CreateTeamsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :teams_users do |t|
      t.references :team, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
