# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |i|
  Admin.create(
    email: "admin#{i + 1}@sample.com", 
    password: "password", 
    name: "admin#{i + 1}",
    status: i
  )
end

User.create(
  email: 'user1@sample.com', 
  password: 'password', 
  nickname: 'user1'
)

