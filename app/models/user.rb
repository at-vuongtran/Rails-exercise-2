class User < ApplicationRecord
  enum gender: { male: 1, female: 2, unknown: 3 }
  validates :name, presence: true
  validates :address, presence: true
  validates :gender, presence: true,
                 numericality: { less_than: 4, greater_than: 0 }
  validates :phone_number,:presence => true,
                 :numericality => true,
                 :length => { is: 10 }
  validates :comments_count, null: false
  # Từ user lấy ra được những bài posts của user đó
  has_many :posts, dependent: :destroy
  has_many :teams_users
  # Từ user lấy ra được những comments của user đó
  has_many :all_comments, class_name: Comment.name
  # Từ user lấy ra được những comments của thuộc về những bài posts của user đó
  has_many :comments, through: :posts, source: :comments
  # Từ user lấy ra những teams của user đó
  has_many :teams, through: :teams_users
  # Từ user lấy ra những leader của mình
  has_many :leaders, through: :teams, source: :leader
  
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  scope :male, -> { where(gender: :male) }
  scope :female, -> { where(gender: :female) }
  scope :unknown, -> { where(gender: :unknown) }
end
