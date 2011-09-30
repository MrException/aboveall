# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'factory_girl'
Dir[Rails.root.join("spec/factories.rb")].each {|f| require f}

puts 'DELETING USERS AND ROLES'
User.delete_all
Role.delete_all

puts 'CREATING ROLES'
FactoryGirl.create :unauthorized_role
FactoryGirl.create :authorized_role
FactoryGirl.create :admin_role
puts "Created three roles.\n"

puts 'SETTING UP DEFAULT ADMIN USER'
user = FactoryGirl.create :admin
puts "Created admin user.\n"

puts 'SETTING UP DEFAULT USER LOGIN'
user = FactoryGirl.create :user
puts "Created new user.\n"

puts 'SETTING UP DUMMY USER LOGIN'
user = FactoryGirl.create :dummy_user
puts "Created dummy user.\n"
