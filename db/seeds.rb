# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create fake users
10.times do 
	User.create!(

		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: 'helloworld'

		)
end

users = User.all

# Create fake items
30.times do
	Item.create!(

		user: users.sample,
		name: Faker::Lorem.sentence

		)
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
