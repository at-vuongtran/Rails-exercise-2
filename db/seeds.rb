100.times do |n|
  Comment.create!(user_id: rand(99), post_id: rand(100), content: "comment number: #{ n + 1 }")
end
