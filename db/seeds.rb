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


Product.create!(title: "product1", description: "description1", goal_price: 1, due_date: Time.zone.now+2.month, state: :draft,  user_id: 1)
Product.create!(title: "product2", description: "description2", goal_price: 10, due_date: Time.zone.now+2.month, state: :active, user_id: 1)
Product.create!(title: "product3", description: "description3", goal_price: 100, due_date: Time.zone.now+2.month, state: :archived, user_id: 2)
Product.create!(title: "product4", description: "description4", goal_price: 1000, due_date: Time.zone.now+2.month, state: :archived, user_id: 2)
Product.create!(title: "product5", description: "description5", goal_price: 10000, due_date: Time.zone.now+2.month, state: :archived, user_id: 2)