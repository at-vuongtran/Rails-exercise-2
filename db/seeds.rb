100.times do |n|
  Post.create(user_id: n % 5 + 4, title: "title #{n}", content: "content for title #{n}", comments_count: 0 )
end
