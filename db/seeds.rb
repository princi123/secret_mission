# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# rake task to create user ####
User.new({ :email => 'user@example.com', :password => 'password', :password_confirmation => 'password'}).save


## rake task to create multiple users ######
user_array = []                                                         
(1..4).each do |num|                                                       
  user_array <<  User.create!( email: "admin#{num}@example.com", password: "password#{num}", password_confirmation: "password#{num}")
end  


#### rake task to create admin user  ######## 

user = User.new({ :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'})
user.admin = true
user.save

#### To generate bulk secret codes ####
SecretCode.create_bulk_codes(10)