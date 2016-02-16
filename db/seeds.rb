# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

30.times do
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, password: "test")
end

100.times do
	Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, grade: 1, gpa: 1.5, detentions: 1, gender: 'M', teacher_id: rand(1..30), snack_food: Faker::Lorem.word, shirt_size: [XS,S,M,L,XL,XXL,XXXL,XXXXL,XXXXXL].sample)
end

User.create!(first_name: "Tom", last_name: "McHenry", username: "tommchenry", password:"test")
