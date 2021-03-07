# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
             email: 'pwc@admin.com',
             password: 'pwc.admin',
             password_confirmation: 'pwc.admin',
             admin: true )

10.times do |_i|
  User.create!(
               email: Faker::Internet.unique.email,
               password: 'password',
               password_confirmation: 'password')
end


2.times do |_i|
  complaint = Complaint.new
  complaint.title = Faker::Name.name
  complaint.body = Faker::Lorem.paragraph_by_chars(number: 200)
  complaint.status = "resolved"
  complaint.user = User.second
  complaint.save
end

2.times do |_i|
  complaint = Complaint.new
  complaint.title = Faker::Name.name
  complaint.body = Faker::Lorem.paragraph_by_chars(number: 200)
  complaint.status = "dismissed"
  complaint.user = User.third
  complaint.save
end

2.times do |_i|
  complaint = Complaint.new
  complaint.title = Faker::Name.name
  complaint.body = Faker::Lorem.paragraph_by_chars(number: 200)
  complaint.status = "pending"
  complaint.user = User.fourth
  complaint.save
end