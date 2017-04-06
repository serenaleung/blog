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

# ['Books', 'TV Shows', 'Movies', 'Clothes', 'Music', 'Food'].each do |category|
#   Category.create(name: category)
# end

# Post.delete_all
20.times do
  Post.create(title: Faker::Name.title,
              body: Faker::Lorem.paragraph(60, false, 20),
              # date: Faker::Date.backward(14)
              # category: Faker::Name.title,
  )

end

Post.all.each do |post|
  3.times do
    post.comments.create(image: Faker::LoremPixel.image("65x65", true),
                   name: Faker::Name.title,
                   body: Faker::Lorem.paragraph(4, false, 5),
                  #  date: Faker::Date.backward(14)
                   # category: Faker::Name.title,
    )
  end
end
