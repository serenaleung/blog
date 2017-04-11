# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)

# Post.find_or_create_by(title: 'bob') do |p|
#   p.body = Faker::Name.body
# end


# Category.create(
# [
#   {category: 'Books'},
#   {category: 'TV Shows'},
#   {category: 'Movies'},
#   {category: 'Clothes'},
#   {category: 'Music'},
#   {category: 'Food'},
# ]
# )
# category = Category.all

#
# ['Books', 'TV Shows', 'Movies', 'Clothes', 'Music', 'Food'].each do |category|
#   Category.create(name: category)
# end

# Post.delete_all
7.times do
 Category.create(title: Faker::Commerce.department
 )
end
puts 'Categories Created'

20.times do
  Post.create(title: Faker::Name.title,
              body: Faker::Lorem.paragraph(60, false, 20),
              date: Faker::Date.backward(90),
              category: Category.all.sample
  )
  puts "Posts Created"
end



Post.all.each do |post|
  3.times do
    post.comments.create(image: Faker::LoremPixel.image("65x65", true),
                   name: Faker::Name.title,
                   body: Faker::Lorem.paragraph(4, false, 5),
                   date: Faker::Date.backward(14)
    )
  end
  puts "Comments Created"
end

3.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              date: Faker::Date.backward(14),
              password: '1234',
              image: 'http://lorempixel.com/g/65/65'
  )
  puts "Users Created"
end
