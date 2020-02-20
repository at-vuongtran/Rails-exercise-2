class User < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :gender, presence: true
  validates :phone_number,:presence => true,
                 :numericality => true,
                 :length => { is: 10 }
  validates :comments_count, null: false
	# Từ user lấy ra được những bài posts của user đó
	has_many :posts
	has_many :teams_users
	# Từ user lấy ra được những comments của user đó
	has_many :all_comments, class_name: Comment.name
	# Từ user lấy ra được những comments của thuộc về những bài posts của user đó
	has_many :comments, through: :posts, source: :comments
	# Từ user lấy ra những leader của mình
	has_many :leaders, through: :teams, source: :leader
	# Từ user lấy ra những teams của user đó
	has_many :teams, through: :teams_users
	# scope :sex -> {
  # }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
