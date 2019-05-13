# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: "administer@example.com",
             password: "administer",
             confirmed_at: Time.zone.now-1.month
            )


100.times do |n|
    User.create!(email: "example_#{n}@example.com",
                 password: "password",
                 confirmed_at: Time.zone.now-1.month
                 )
end


100.times do |n|
    Product.create!(title: "product#{n}",
                    description: "description#{n}",
                    goal_price: 1000000,
                    due_date: Time.zone.now+2.month,
                    state: :draft,
                    user_id: User.find(rand(1..99)).id
                    )
end

100.times do 
    Investment.create!(price: 1000*rand(1..100),
                       user_id: User.find(rand(1..99)).id,
                       product_id: Product.find(rand(1..99)).id
                       )
end
