# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating Roles..."
roles = ["superadmin"].each do |role|
  Role.find_or_create_by(:name=>role)
end

puts "Creating SuperAdmin..."
u=User.find_or_create_by(:email=>'sam_sarmad@hotmail.com')
u.password = "please11"
u.password_confirmation = "please11"
u.add_role :superadmin
u.save