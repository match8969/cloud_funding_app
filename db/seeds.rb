# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(email: "mmmmmm@yahoo.co.jp",
             password: "password")

User.create!(email: "tttttt@yahoo.co.jp",
             password: "password")

Category.create!(name: "culture")
Category.create!(name: "school")
Category.create!(name: "nature")
Category.create!(name: "local")

Product.create!(title: "product1", description: "description1", goal_price: 1, due_date: Time.zone.now+2.month, state: :draft, category_ids: [1, 2, 3], user_id: 1) # なぜ[0]出ない?
Product.create!(title: "product2", description: "description2", goal_price: 10, due_date: Time.zone.now+2.month, state: :active, category_ids: [1], user_id: 1)
Product.create!(title: "product3", description: "description3", goal_price: 100, due_date: Time.zone.now+2.month, state: :archived, category_ids: [2], user_id: 2)