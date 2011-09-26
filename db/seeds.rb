# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'DELETING USERS AND ROLES'
User.delete_all
Role.delete_all

puts 'CREATING ROLES'
admin_role = Role.create! ({ :name => 'admin'})
authorized_role = Role.create! ({ :name => 'authorized'})
unauthorized_role = Role.create! ({ :name => 'unauthorized'})
puts "Created three roles.\n"

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! ({ :first_name => 'Bobby',
  last_name: 'McGee',
  email: 'user@test.com',
  password: 'please',
  password_confirmation: 'please',
  road: "213 Here Rd",
  city: "Kelowna",
  province: "BC",
  city: "Kelowna",
  postal_code: "a1a1a1",
  gender: "M",
  dob: Time.now
})
r = Role.where(:name => 'authorized').first
user.role = r
user.save
puts "Created new user.\n"

puts 'SETTING UP DEFAULT ADMIN USER'
user = User.create! ({ :first_name => 'Bobby',
  last_name: 'McGee',
  email: 'admin@test.com',
  password: 'please',
  password_confirmation: 'please',
  road: "213 Here Rd",
  city: "Kelowna",
  province: "BC",
  city: "Kelowna",
  postal_code: "a1a1a1",
  gender: "M",
  dob: Time.now
})
r = Role.where(:name => 'admin').first
user.role = r
user.save
puts "Created admin user.\n"
