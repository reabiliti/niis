# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '*** Admin user ***'
admin_user = User.find_by_email('admin@gmail.com')
if admin_user
  puts 'Admin user already created'
else
  User.create!(name: 'Admin', role: 'member', email: 'admin@gmail.com', password: '1qaz2wsx3edc*', password_confirmation: '1qaz2wsx3edc*')
  puts 'Admin user created'
end
