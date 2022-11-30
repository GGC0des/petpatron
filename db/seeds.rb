# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Removing all existing data .."

Donation.destroy_all
Emergency.destroy_all
Shelter.destroy_all
User.destroy_all

puts "Creating users .."

User.create!(
  first_name: "Peter",
  last_name: "Paul",
  email: "peter@paul.com",
  password: "123456"
)
User.create!(
  first_name: "Mary",
  last_name: "Jane",
  email: "mary@jane.com",
  password: "123456"
)
User.create!(
  first_name: "Salvatore",
  last_name: "Bianci",
  email: "salvatore@bianci.com",
  password: "123456"
)

puts "#{User.all.size} users created."

puts "Creating shelters .."

21.times do
  file = URI.open(Faker::LoremFlickr.image(search_terms: ['animal', 'shelter']))
  shelter = Shelter.new(
    name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: rand(3..7)),
    location: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    email: Faker::Internet.email,
    user_id: User.all.sample.id
  )
  shelter.photos.attach(io: file, filename: "#{Faker::Hobby.activity}.jpg", content_type: "image/jpg")
  shelter.save!
  print "x"
end

puts ""
puts "#{Shelter.all.size} shelters created."

puts "Creating animals .."

Shelter.all.each do |shelter|
  rand(0..3).times do
    file = URI.open(Faker::LoremFlickr.image(search_terms: ['dog', 'cat', 'rabbit']))
    animal = Animal.new(
      name: Faker::Name.middle_name,
      description: Faker::Lorem.paragraph(sentence_count: 7),
      sex: ["male", "female"].sample,
      size: "#{rand(0.1..1.5)} m",
      species: Faker::Creature::Animal,
      shelter_id: shelter.id
    )
    animal.photos.attach(io: file, filename: "#{Faker::Hobby.activity}.jpg", content_type: "image/jpg")
    animal.save!
  end
  print "x"
end

puts ""
puts "#{Animal.all.size} animals created."

puts "Creating emergencies"

Animal.all.each do |animal|
  rand(0..2).times do
    file = URI.open(Faker::LoremFlickr.image(search_terms: ['emergency', 'animal']))
    emergency = Emergency.new(
      title: Faker::Food.vegetables,
      description: Faker::Lorem.paragraph(sentence_count: 7),
      fundraising_goal: rand(1..1000),
      animal_id: animal.id
    )
    emergency.photos.attach(io: file, filename: "#{Faker::Hobby.activity}.jpg", content_type: "image/jpg")
    emergency.save!
  end
  print "x"
end

puts ""
puts "#{Emergency.all.size} emergencies created."

puts "Creating donations"

Emergency.all.each do |emergency|
  rand(0..7).times do
    Donation.create!(
      donation_amount: rand(5..100),
      comment: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
      user_id: User.all.sample.id,
      emergency_id: emergency.id
    )
  end
  print "x"
end

puts ""
puts "#{Donation.all.size} donations created."

puts "Creating caretakings"

(Animal.all.size / 3).times do
  Caretaking.create!(
    date: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
    volunteer_type: [].sample,
    animal_id: Animal.all.sample.id,
    user_id: User.all.sample.id
  )
  print "x"
end

puts ""
puts "#{Caretaking.all.size} caretakings created."
