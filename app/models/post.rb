class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :comments_count, presence: true
  belongs_to :user
  # Từ bài post lấy ra được những comments của bài post đó
  has_many :comments, dependent: :destroy

  def self.search(search)
    if(search)
      Post.where("title LIKE '%#{search}%'")
    else
      Post.all
    end
  end
end
