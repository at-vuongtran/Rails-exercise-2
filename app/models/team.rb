class Team < ApplicationRecord
	has_many :teams_users
	# Từ team lấy ra những users của team đó
	has_many :users, through: :teams_users
	# Từ team lấy ra được leader của team đó
	belongs_to :leader, class_name: User.name , foreign_key: "leader_id"
end
