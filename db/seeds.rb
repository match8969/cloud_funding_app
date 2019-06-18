# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: "administer@example.com",
             password: "administer",
             role: :administer,
             confirmed_at: Time.zone.now-1.month,
             name: "administer"
            )


20.times do |n|
    User.create!(email: "example_#{n+1}@example.com",
                 password: "password",
                 confirmed_at: Time.zone.now-1.month,
                 name: "example_#{n+1}"
                 )
end


20.times do |n|
    Product.create!(title: "product#{n}",
                    description: "description#{n}",
                    goal_price: 1000000,
                    due_date: Time.zone.now+2.month,
                    state: :draft,
                    user_id: User.find(n+1).id
                    )
end

20.times do |n|
    Investment.create!(price: 1000*rand(1..100),
                       user_id: User.find(rand(1..19)).id,
                       product_id: Product.find(n+1).id,
                       created_at: Time.zone.now-1.month,
                       updated_at: Time.zone.now
                       )
end

20.times do |n|
    Category.create!(name: "category_name_#{n}")
end

20.times do |n|
  Watching.create!(user_id: User.find(n+1).id, category_id: Category.find(n+1).id)
end