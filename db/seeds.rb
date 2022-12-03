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
  "Zooallee 1, 39124 Magdeburg", "Kalletal, 32689 Kalletal", "Holzminden, 37603 Holzminden", "Gartenstraße 33, 19230 Strohkirchen", "Koogstraße 32, 24863 Börm", "St.-Laurentius-Straße 3, 36041 Fulda", "Kantstraße 66,Eisenach", "Marseiller Strasse 14, Sindelsdorf", "Gotthardstrasse 82, Chemnitz", "Budapester Straße 59, Niederbach", "Borstelmannsweg 2, Staffelstein", "Mohrenstrasse 11, Berlin", "Grosse Praesidenten Str. 84, Berlin", "Guentzelstrasse 98, Berlin", "Eichendorffstr. 20, Tuningen", "Lietzensee-Ufer 64, Senftenberg", "Holsteiner Chaussee 49, 22523 Hamburg", "Wandsbeker Marktstraße 1, 22041 Hamburg", "Kröpeliner Str. 30, 18055 Rostock", "Gotthardstrasse 16, Erfurt", "Sömmeringstr. 20, Pforzheim", "Kantstrasse 75, Nürnberg", "ul. Kujawska 79, Katowice", "ul. Pałucka 84, Poznań", "Sonnenweg 119, Matran", "Wiesenstrasse 138, Basel", "Weblinger Gürtel 47, Hengstberg", "Wiehtestrasse 46, Siedlung", "Pottendorfer Strasse 6, Rodelsbach", "Iepenlaan 195, Roermond", "Wolfsdonk 178, Chaam"
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
      size: "#{rand(0.1..1.5)} m",
      species: Faker::Creature::Animal,
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
