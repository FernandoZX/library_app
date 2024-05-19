# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

unless User.exists?(email: 'librarian@library-app.com')
  User.create!(email:'librarian@library-app.com', password:'password', password_confirmation:'password',
  first_name:'Fernando', last_name:'cabrera', age:35)
end

User.create!(email:'demo@library-app.com', password:'password', password_confirmation:'password',
  first_name:'demo', last_name:'demo', age:35)

# Random Books Seed
100.times do
  Book.create!(title:Faker::Book.title, author:Faker::Book.author, genre:Faker::Book.genre,isbn:Faker::Code.isbn, total_copies:rand(100))
end
# Random Member users
10.times do
  User.create!(email:Faker::Internet.email, password:'password', password_confirmation:'password',
  first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(100))
end