puts "Removing all existing data .."

Donation.destroy_all
Emergency.destroy_all
Shelter.destroy_all
User.destroy_all
Animal.destroy_all
Category.destroy_all

puts "Creating users that are animal lovers .."

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

puts "Creating shelters and owners ..."

i = 0
location_array = [
  "Zooallee 1, 39124 Magdeburg", "Ostkampweg 23, 33659 Bielefeld", "Sollingstraße 54, 37603 Holzminden", "Gartenstraße 33, 19230 Strohkirchen", "Koogstraße 32, 24863 Börm", "St.-Laurentius-Straße 3, 36041 Fulda", "Clemensstraße 31, 99817 Eisenach", "Wilbrechtweg 5, 82404 Sindelsdorf", "Clausstraße 47, 09126 Chemnitz", "Niederbach 57, 77790 Steinach", "Hammer Landstraße 120, 20537 Hamburg", "Mohrenstraße 11, 10117 Berlin", "Große Präsidentenstraße 84, 10178 Berlin", "Güntzelstraße 98, 10717 Berlin", "Eichendorffstraße 20, 78166 Donaueschingen", "Bahnhofstraße 13, 01968 Senftenberg", "Holsteiner Chaussee 49, 22523 Hamburg", "Wandsbeker Marktstraße 1, 22041 Hamburg", "Kröpeliner Str. 30, 18055 Rostock", "Johannesstraße 165, 99084 Erfurt", "Schloßberg 14, 75175 Pforzheim", "Bayreuther Str. 10, 90489 Nürnberg", "Dorfstraße 15, 03172 Jänschwalde", "Markt 2, 15890 Eisenhüttenstadt", "Schänzlistrasse 45, 3013 Bern", "Steinentorberg 12, 4051 Basel", "Hauptstraße 25, 77960 Seelbach", "Bornwald 1, 63303 Dreieich", "Höhenweg 24, 4463 Großraming", "Lindenallee 50, 41334 Nettetal", "Bachstraße 7, 26892 Dörpen"
]
while i < 31 do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "lewagon"
  )
  file = URI.open(Faker::LoremFlickr.image(search_terms: ['animal', 'shelter']))
  shelter = Shelter.new(
    name: Faker::Company.name,
    description: Faker::Lorem.paragraph(sentence_count: rand(3..7)),
    location: location_array[i],
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    email: Faker::Internet.email,
    user_id: user.id
  )
  shelter.photos.attach(io: file, filename: "#{Faker::Hobby.activity}.jpg", content_type: "image/jpg")
  shelter.save!
  print "x"
  i += 1
end

puts "#{Shelter.all.size} shelters created."

puts "Creating animals .."

Shelter.all.each do |shelter|
  rand(0..3).times do
    file = URI.open(Faker::LoremFlickr.image(search_terms: ['dog', 'cat', 'rabbit']))
    animal = Animal.new(
      name: Faker::Name.middle_name,
      description: Faker::Lorem.paragraph(sentence_count: 7),
      sex: ["male", "female"].sample,
      size: ["Small", "Medium", "Large"].sample,
      species: Faker::Creature::Animal.name,
      shelter_id: shelter.id
    )
    animal.photos.attach(io: file, filename: "#{Faker::Hobby.activity}.jpg", content_type: "image/jpg")
    animal.save!
  end
  print "x"
end

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

puts "#{Donation.all.size} donations created."


puts "Creating categories"

Category.create!(
  name: "Adoption"
)

Category.create!(
  name: "Foster Home"
)

Category.create!(
  name: "Dog Walking"
)
Category.create!(
  name: "Grooming"
)
Category.create!(
  name: "Playtime"
)

puts "All categories created!"

puts "Creating Animal_Categories"

Animal.all.each do |animal|
  AnimalCategory.create!(
    animal: animal,
    category: Category.all.sample
  )
end
puts "#{AnimalCategory.all.size} animal categories created
and connected to both animal-table and category-table through animal_category-table"

puts "Creating caretakings"

(Animal.all.size / 3).times do
  Caretaking.create!(
    date: Faker::Time.between(from: DateTime.now - 365, to: DateTime.now),
    animal_id: Animal.all.sample.id,
    user_id: User.all.sample.id,
    category: Category.all.sample
  )
  print "x"
end

puts "#{Caretaking.all.size} caretakings created."

puts "Seeding done"
