class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true
	belongs_to :user
  belongs_to :post
  
  after_save :increment_comments_count
  before_destroy :decrement_comments_count

  def increment_comments_count
    User.find(self.user_id).increment!(:comments_count)
    Post.find(self.post_id).increment!(:comments_count)
  end

  def decrement_comments_count
    User.find(self.user_id).decrement!(:comments_count)
  end
end
