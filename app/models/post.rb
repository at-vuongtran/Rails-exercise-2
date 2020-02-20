class Post < ApplicationRecord
	belongs_to :user
	# Từ bài post lấy ra được những comments của bài post đó
	has_many :comments
end
