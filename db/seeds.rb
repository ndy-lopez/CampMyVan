puts "Cleaning the db..."
User.destroy_all

puts "Creating 20 users..."

20.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  puts "User with id #{user.id} was created"
end

puts "All done!"
