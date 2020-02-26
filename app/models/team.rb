class Team < ApplicationRecord
  validates :name, presence: true
  validates :leader_id, presence: true
  has_many :teams_users
  # Từ team lấy ra những users của team đó
  has_many :users, through: :teams_users
  # Từ team lấy ra được leader của team đó
  belongs_to :leader, class_name: User.name , foreign_key: "leader_id"

  def self.search(search)
    if(search)
      Team.where("name LIKE '%#{search}%'")
    else
      Team.all
    end
  end
end
