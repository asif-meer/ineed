# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  require 'roo'

  puts "Creating Roles..."
  roles = ["superadmin","vendor","user"].each do |role|
    Role.find_or_create_by(:name=>role)
  end

puts "Creating SuperAdmin..."
# u=User.find_or_create_by(:email=>'sam_sarmad@hotmail.com')
u=User.find_or_create_by(:email=>'asif_meer_2k6@yahoo.com')
u.password = "please11"
u.password_confirmation = "please11"
u.add_role :superadmin
u.save


(1..5).each do |index|
  user_email = "user#{index}@example.com"
  vendor_email = "vendor#{index}@example.com"

  u = User.find_or_create_by(:email=> user_email)
  u.password = "admin123"
  u.password_confirmation = "admin123"
  u.add_role :user
  u.save

  v = User.find_or_create_by(:email=> vendor_email)
  v.password = "admin123"
  v.password_confirmation = "admin123"
  v.add_role :vendor
  v.save

end


# Categories seed
  spreadsheet = Roo::Excelx.new("words_cat.xlsx")
  p_main_category_name = ""
  (2..spreadsheet.last_row).each_with_index do |i,index|
    row = spreadsheet.row(i)
    p_main_category_name = row[0] unless row[0].blank?
    row[0] = p_main_category_name if  row[0].blank?
    puts "#{row.map{ |r| r.capitalize unless r.nil? }}"
    filtered_row = row.map{ |r| r.capitalize unless r.nil? }
    main_cat = Category.find_or_create_by :name => "#{row[0].capitalize}"
    main_cat.children.find_or_create_by :name => "#{row[1].capitalize}" unless row[1].nil?
    main_cat.children.find_or_create_by :name => "#{row[2].capitalize}" unless row[2].nil?
  end
  
# alarm_cat = Category.find_or_create_by(:name => "Alarm")
# alarm_cat.children.find_or_create_by :name => 'Watch'
# alarm_cat.children.find_or_create_by :name => 'Wall clock'

# toilet_cat = Category.find_or_create_by(:name => "Toilet")
# toilet_cat.children.find_or_create_by :name => 'Tissue'
# toilet_cat.children.find_or_create_by :name => 'Toilet roll'

# toilet_cat = Category.find_or_create_by(:name => "Toilet")
# toilet_cat.children.find_or_create_by :name => 'Tissue'
# toilet_cat.children.find_or_create_by :name => 'Toilet roll'

# toilet_cat = Category.find_or_create_by(:name => "Toilet")
# toilet_cat.children.find_or_create_by :name => 'Tissue'
# toilet_cat.children.find_or_create_by :name => 'Toilet roll'


