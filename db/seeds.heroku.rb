# production seed data
# Seeding images via cloudinary
require "open-uri"

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
  last_name: "Lowe",
  email: "peter@sample.com",
  password: "123456"
)
User.create!(
  first_name: "Merle",
  last_name: "Ludwig",
  email: "merle@sample.com",
  password: "123456"
)

User.create!(
  first_name: "Nik",
  last_name: "Hero",
  email: "nik@mail.com",
  password: "lewagon"
)

puts "#{User.all.size} animal lovers created."




puts "Creating shelter owners and their shelters"


print "x"

bailey = User.create!(
  first_name: "Bailey",
  last_name: "Harris",
  email: "bailey@mail.com",
  password: "lewagon"
)

shelter1 = Shelter.create!(
  name: "Bailey's Friends",
  description: "We rescue street dogs and cats from kill shelters in Romania and partner with organisations across Germany and Austria.",
  location: "Drübecker Weg 3, 12059 Berlin",
  phone_number: "030 94521 67390",
  email: "info@baileysfriends.com",
  user: bailey
)

  file1 = URI.open("https://images.unsplash.com/photo-1583786102038-6fce0083f370?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
  shelter1.photos.attach(io: file1, filename: "shelter.png", content_type: "image/png")
  file2 = URI.open("https://images.unsplash.com/photo-1604606363386-dd3f2357ad87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGFuaW1hbCUyMHNoZWx0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
  shelter1.photos.attach(io: file2, filename: "shelter.png", content_type: "image/png")
  file3 = URI.open("https://images.unsplash.com/photo-1583786693544-e352f898888d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGFuaW1hbCUyMHNoZWx0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
  shelter1.photos.attach(io: file3, filename: "shelter.png", content_type: "image/png")

print "x"

  georgina = User.create!(
    first_name: "Georgina",
    last_name: "Smith",
    email: "georgina@mail.com",
    password: "lewagon"
  )

  shelter2 = Shelter.create!(
    name: "Georgina's Galgo Rescue",
    description: "Approximately 60,000 Spanish Greyhounds (Galgos) are killed and tortured every year due to cruel hunting traditions. Georgina's rescue is trying to save as many as possible.",
    location: "Paul-Robeson-Strasse, 10439 Berlin",
    phone_number: "030 5991 44391",
    email: "info@galgorescue.com",
    user: georgina
  )


  file4 = URI.open("https://images.unsplash.com/photo-1601758177266-bc599de87707?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
  shelter2.photos.attach(io: file4, filename: "shelter.png", content_type: "image/png")
  file5 = URI.open("https://images.unsplash.com/photo-1576710770695-3ee4ca928582?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80")
  shelter2.photos.attach(io: file5, filename: "shelter.png", content_type: "image/png")
  file6 = URI.open("https://images.unsplash.com/photo-1562319676-974235d20791?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80")
  shelter2.photos.attach(io: file6, filename: "shelter.png", content_type: "image/png")


print "x"

maxi = User.create!(
  first_name: "Maxi",
  last_name: "Wonder",
  email: "maxi@mail.com",
  password: "lewagon"
)

shelter5 = Shelter.create!(
  name: "Little Paws Shelter",
  description: "This shelter has been run through three generations, founded by Nana Rosi and her great compassion for animals left behind during the war.",
  location: "Gartenstraße 33, 19230 Strohkirchen",
  phone_number: "09876 94521 67390",
  email: "info@littlepaws.com",
  user: maxi
)

file10 = URI.open("https://images.unsplash.com/photo-1542715234-4bafcfc68bd9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGFuaW1hbCUyMHNoZWx0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
shelter5.photos.attach(io: file10, filename: "shelter.png", content_type: "image/png")


print "x"

jess = User.create!(
  first_name: "Jess",
  last_name: "Enders",
  email: "jess@mail.com",
  password: "lewagon"
)

shelter4 = Shelter.create!(
  name: "Best Puppies United",
  description: "This rescue organisation was founded in 2022. Sadly a lot of people wanted to get rid of their new pets after home office was revoked.",
  location: "Zooallee 1, 39124 Magdeburg",
  phone_number: "040 94521 67390",
  email: "info@puppsters.com",
  user: jess
)

  file9 = URI.open("https://images.unsplash.com/photo-1594004844563-536a03a6e532?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
  shelter4.photos.attach(io: file9, filename: "shelter.png", content_type: "image/png")

print "x"

bruna = User.create!(
  first_name: "Bruna",
  last_name: "Noel",
  email: "bruna@mail.com",
  password: "lewagon"
)

shelter3 = Shelter.create!(
  name: "Cats N' Dogs",
  description: "Bruna has always dreamt of rescuing all the cats and puppies. Her organisation relies on all the loving foster homes to help get the animals of the street.",
  location: "Ostkampweg 23, 33659 Bielefeld",
  phone_number: "02986 94521 67390",
  email: "info@catsndogs.com",
  user: bruna
)

  file7 = URI.open("https://images.unsplash.com/photo-1625107012478-2fb7eceb7577?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGFuaW1hbCUyMHNoZWx0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
  shelter3.photos.attach(io: file7, filename: "shelter.png", content_type: "image/png")
  file8 = URI.open("https://images.unsplash.com/photo-1604606363386-dd3f2357ad87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGFuaW1hbCUyMHNoZWx0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
  shelter3.photos.attach(io: file8, filename: "shelter.png", content_type: "image/png")


print "x"

itzi = User.create!(
  first_name: "Itziar",
  last_name: "Gomez",
  email: "itzi@mail.com",
  password: "lewagon"
)

shelter6 = Shelter.create!(
  name: "Charly's Happy Ever After",
  description: "This shelter does not only house cats, dogs but also gives retired racing horses a forever home to retire",
  location: "Sollingstraße 54, 37603 Holzminden",
  phone_number: "094521 67390",
  email: "info@charlys.com",
  user: itzi
)

  file11 = URI.open("https://images.unsplash.com/photo-1510783030144-d2a7f91e88a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzV8fGFuaW1hbCUyMHNoZWx0ZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60")
  shelter6.photos.attach(io: file11, filename: "shelter.png", content_type: "image/png")


  print "x"

  rico = User.create!(
    first_name: "Rico",
    last_name: "Torres",
    email: "rico@mail.com",
    password: "lewagon"
  )

  shelter7 = Shelter.create!(
    name: "Tails of the City",
    description: "When Rico and his wife Paula traveled to Greece, they had not planned to come back with three dogs. Yet this is what set it all in motion",
    location: "Koogstraße 32, 24863 Börm",
    phone_number: "0229 94521 67390",
    email: "info@tailsofthecity.com",
    user: rico
  )

    file12 = URI.open("https://images.unsplash.com/photo-1444212477490-ca407925329e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RyZWV0JTIwZG9nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60")
    shelter7.photos.attach(io: file12, filename: "shelter.png", content_type: "image/png")

  print "x"

  nadia  = User.create!(
    first_name: "Nadia",
    last_name: "Hirsch",
    email: "nadia@mail.com",
    password: "lewagon"
   )

   shelter8 = Shelter.create!(
    name: "Furry Tales",
    description: "Once upon a time Nadia, Michelle and Rhys kept and kept coming to Mrs. Hirsch's backgarden. That is how her little shelter started",
    location: "St.-Laurentius-Straße 3, 36041 Fulda",
    phone_number: "0960 94521 67390",
    email: "info@furrytales.com",
    user: nadia
   )

     file13 = URI.open("https://images.unsplash.com/photo-1583787317796-2bc56f8556e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YW5pbWFsJTIwc2hlbHRlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
     shelter8.photos.attach(io: file13, filename: "shelter.png", content_type: "image/png")


print "x"

lars = User.create!(
  first_name: "Lars",
  last_name: "Beck",
  email: "lars@mail.com",
  password: "lewagon"
)

shelter9 = Shelter.create!(
  name: "Angel's Rescue",
  description: "In honour of his companion animal Angel, this shelter houses cats that have a hard time finding a new home.",
  location: "Clemensstraße 31, 99817 Eisenach",
  phone_number: "094521 67390",
  email: "info@angelsrescue.com",
  user: lars
)

  file14 = URI.open("https://images.unsplash.com/photo-1558618047-f4b511aae74d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGNhdCUyMHNoZWx0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
  shelter9.photos.attach(io: file14, filename: "shelter.png", content_type: "image/png")


print "x"

kim = User.create!(
  first_name: "Kim",
  last_name: "Hummel",
  email: "kim@mail.com",
  password: "lewagon"
)

shelter10 = Shelter.create!(
  name: "Fur Get Me Not",
  description: "Old dogs, black cats, they deserve love more than anyone else! Adopting an animal might not change the world, but it changes the whole world for one animal!",
  location: "Wilbrechtweg 5, 82404 Sindelsdorf",
  phone_number: "06789 94521 67390",
  email: "info@furgetmenot.com",
  user: kim
)

  file15 = URI.open("https://images.unsplash.com/photo-1612195329945-8d218d4ae70b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG9sZCUyMGRvZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
  shelter10.photos.attach(io: file15, filename: "shelter.png", content_type: "image/png")


print "x"

patty = User.create!(
  first_name: "Patty",
  last_name: "Drem",
  email: "patty@mail.com",
  password: "lewagon"
)

shelter11 = Shelter.create!(
  name: "Patty's Sanctuary",
  description: "Miss Patty takes care of over 40 ex lab rats, 8 rabbits, 12 Guinea pigs and a loving pair of Chin Chila",
  location: "Clausstraße 47, 09126 Chemnitz",
  phone_number: "010 94521 67390",
  email: "info@pattys.com",
  user: patty
)

  file16 = URI.open("https://images.unsplash.com/photo-1588159528448-65810419026e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fGd1aW5lYSUyMHBpZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60")
  shelter11.photos.attach(io: file16, filename: "shelter.png", content_type: "image/png")



print "x"

rory = User.create!(
  first_name: "Rory",
  last_name: "Gutenberg",
  email: "rory@mail.com",
  password: "lewagon"
)

shelter12 = Shelter.create!(
  name: "Licks & Kisses",
  description: "Traumatized dogs and cats come to Rory's shelter to learn how to trust humans again and find their happily ever after",
  location: "Niederbach 57, 77790 Steinach",
  phone_number: "0476 94521 67390",
  email: "info@licksandkisses.com",
  user: rory
)

  file17 = URI.open("https://images.unsplash.com/photo-1596383924439-4d410af270f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGFuaW1hbCUyMHNoZWx0ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")
  shelter12.photos.attach(io: file17, filename: "shelter.png", content_type: "image/png")


puts "#{Shelter.all.size} shelters created."

puts "Creating dogs .."

healthy_dogs = [
  "https://images.unsplash.com/photo-1705620762642-6c737ba3b63e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1688152591520-f385d059e612?q=80&w=2064&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1733985859275-38a98fcafd5d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1605364699459-28c629cd41fc?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1643786259916-a546902a83bd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1643786262347-c7320a0913d6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1594907259769-fde45d5b7f77?q=80&w=2146&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1643786259439-812762c18d35?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1643786262383-71182213ac13?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1643786258638-ba20cfe7382f?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1593991910463-03658d3de800?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1670370752910-1aae175d567f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1598739871560-29dfcd95b823?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1578702162891-739689c99909?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1596838005467-a34b063fc0b5?q=80&w=2068&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1605484649538-98578113d4f1?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1730211067260-2eeaf1f703b2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1653077701146-bfc3b297d3ef?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1689400119492-e7d13f1a8136?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1687425961065-46efeb465c66?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1583885627072-4823ed115094?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1601542271917-306a64c1a063?q=80&w=2050&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
]


dog_names = [
  "Fuzzy", "Snuggles", "Bubbles", "Tootsie", "Cuddles", "Wiggles", "Kissy", "Snoopy", "Peanut", "Gizmo",
  "Cotton", "Muffin", "Trixie", "Buttercup", "Puddles", "Gizmo", "Taco", "Pimpim", "Rufus", "Snickers", "Biscuit",
  "Marshmallow", "Pickles", "Nibbles", "Mocha", "Pumpkin", "Cupcake", "Sprinkles", "Scooter", "Waffles", "Ziggy",
  "Churro", "Pebbles", "Jellybean", "Mochi", "Fluffy", "Bluey", "Daisy", "Tinker", "Frito", "Cheddar",
  "Cinnamon", "Wiggy", "Popcorn", "Goober", "Buttons", "Nugget", "Sally", "Taffy", "Bambi", "Juno"
]

healthy_dogs.each do |img|
  dog_file = URI.open(img)

  animal = Animal.new(
    name: dog_names.sample,
    description: "Timid towards strangers, but once you become friends you'll receive a lot of kisses and licksies.",
    sex: ["Male", "Female"].sample,
    size: ["Small", "Medium", "Large"].sample,
    species: "Dog",
    shelter_id: Shelter.all.sample.id
  )

  animal.photos.attach(io: dog_file, filename: "dog.jpg")

  if animal.save
    print "x"
  else
    puts "Failed to create animal: #{animal.errors.full_messages.join(", ")}"
  end
end

puts "#{Animal.all.size} animals created."


puts "Creating emergencies"


emergency1 = Emergency.create!(
  title: "Nala needs urgent hip surgery",
  description: "Nala was found on the side of the road, hours after she was hit by a car. She had to get immediate surgery. She still has an issue with her hip from an old injury and will need a metal plate and physiotherapy in the future.",
  fundraising_goal: "980",
  animal_id: Animal.all.sample.id
)

  e_file1 = URI.open("https://images.unsplash.com/photo-1661175099624-c9b9c2318e15?q=80&w=2152&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  emergency1.photos.attach(io: e_file1, filename: "emergency.jpg", content_type: "image/jpg")

print "x"

emergency2 = Emergency.create!(
  title: "Help Toffee's recovery - sponsor her surgery & meds ",
  description: "Sweet gentle Toffee has had a really sad past. She was abused and beaten by her previous owner and rescued by one of our volunteers. She is at a loving foste home and is recovering from her surgery.",
  fundraising_goal: "430",
  animal_id: Animal.all.sample.id
)

  e_file2 = URI.open("https://images.unsplash.com/photo-1662128614795-4e87f1b98b23?q=80&w=2068&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  emergency2.photos.attach(io: e_file2, filename: "emergency.jpg", content_type: "image/jpg")

print "x"

emergency3 = Emergency.create!(
  title: "Puppy Alert! Please help us cover the costs for special puppy food & vacinations",
  description: "Our volunteers found a litter of 7 abandoned puppies in a box in a back alley. We immediately took them into our care and need your help to cover all the costs!",
  fundraising_goal: "480",
  animal_id: Animal.all.sample.id
)

  e_file3 = URI.open("https://images.unsplash.com/photo-1632236542159-809925d85fc0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dmV0fGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
  emergency3.photos.attach(io: e_file3, filename: "emergency.jpg", content_type: "image/jpg")


print "x"

emergency4 = Emergency.create!(
  title: "Maxi's Medical Fund",
  description: "Maxi is a sweet and loving dog who was recently hit by a car. He needs urgent medical care to recover, but his previous owner couldn't afford the treatment. Your donation will help us pay for Maxi's medical bills and give him a second chance at a happy and healthy life.",
  fundraising_goal: "680",
  animal_id: Animal.all.sample.id
)

  e_file4 = URI.open("https://images.unsplash.com/photo-1599443015574-be5fe8a05783?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dmV0fGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
  emergency4.photos.attach(io: e_file4, filename: "emergency.jpg", content_type: "image/jpg")


print "x"


emergency5 = Emergency.create!(
  title: "Become Charlie's Godparent",
  description: "Charlie is a lovable and playful pupper who was left at a shelter when his previous owner could no longer care for him. Your donation will help us provide food, shelter, and medical care for Charlie until he is ready to be adopted into a forever home.",
  fundraising_goal: "325",
  animal_id: Animal.all.sample.id
)

  e_file5 = URI.open("https://images.unsplash.com/photo-1595738792475-9a29c39aa307?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c3RyZWV0JTIwZG9nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
  emergency5.photos.attach(io: e_file5, filename: "emergency.jpg", content_type: "image/jpg")


print "x"


emergency6 = Emergency.create!(
  title: "Puppy Rescue Mission",
  description: "There are so many streets on the streets right now and our volunteers have worked day and night to catch them and transport them safely to our shelter. We will have a lost of costs to cover, please donate for the puppies food, blankets & toys.",
  fundraising_goal: "1050",
  animal_id: Animal.all.sample.id
)

  e_file6 = URI.open("https://images.unsplash.com/photo-1553434133-96822a8e94af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c3RyZWV0JTIwZG9nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
  emergency6.photos.attach(io: e_file6, filename: "emergency.jpg", content_type: "image/jpg")


print "x"

emergency7 = Emergency.create!(
  title: "Provide a safe haven for Sasha ",
  description: "Sasha is a sweet and gentle puppy who was found wandering the streets. She was malnourished and needed special care. Now she is recovering in our shelter. Your donation will help us provide food, shelter, and medical care for Sasha as she recovers and waits for her forever home.",
  fundraising_goal: "350",
  animal_id: Animal.all.sample.id
)

  e_file7 = URI.open("https://images.unsplash.com/photo-1553688738-a278b9f063e0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  emergency7.photos.attach(io: e_file7, filename: "emergency.jpg", content_type: "image/jpg")


print "x"

emergency8 = Emergency.create!(
  title: "Bella's chance at a better life",
  description: "Bella was in a puppy mill before she was rescued by our organization. She is now recovering and ready for a new home, but she needs your help. Your donation will help us provide essential care and support for Bella as she starts her new life in a loving home.",
  fundraising_goal: "190",
  animal_id: Animal.all.sample.id
)

  e_file8 = URI.open("https://images.unsplash.com/photo-1644675272883-0c4d582528d8?q=80&w=2148&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  emergency8.photos.attach(io: e_file8, filename: "emergency.jpg", content_type: "image/jpg")


print "x"


emergency9 = Emergency.create!(
  title: "Rocky's Rehabilitation",
  description: "Rocky is a brave and resilient dog who was rescued from neglectful owners that kept him chained in their yard. He has been through a lot, but he is now ready to start his new life in a loving home. Your donation will help us provide essential care and support for Rocky as he recovers and learns to trust and love again.",
  fundraising_goal: "265",
  animal_id: Animal.all.sample.id
)

  e_file9 = URI.open("https://images.unsplash.com/photo-1636750446092-6c0b5f801e75?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  emergency9.photos.attach(io: e_file9, filename: "emergency.jpg", content_type: "image/jpg")


print "x"


emergency10 = Emergency.create!(
  title: "Fundraiser for Sweet Lily ",
  description: "Lily was rescued from a hoarding situation. She is now safe and got medical attention she badly needed. Your donation will help us provide food and essential supplies for Lily and other dogs like her.",
  fundraising_goal: "210",
  animal_id: Animal.all.sample.id
)

  e_file10 = URI.open("https://images.unsplash.com/photo-1733210872526-863e2f16cf39?q=80&w=2148&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  emergency10.photos.attach(io: e_file10, filename: "emergency.jpg", content_type: "image/jpg")


print "x"


emergency11 = Emergency.create!(
  title: "Daisy's Medical Fund",
  description: "Daisy needed a lot of surgeries and medication which is why she was surrendered. She is now safe in our shelter, but she needs urgent medical care. Your donation will help us pay for Daisy's medical bills and give her the chance to recover and find a loving home.",
  fundraising_goal: "370",
  animal_id: Animal.all.sample.id
)

  e_file11 = URI.open("https://images.unsplash.com/photo-1722413467474-8290acd91898?q=80&w=2113&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  emergency11.photos.attach(io: e_file11, filename: "emergency.jpg", content_type: "image/jpg")


print "x"


emergency12 = Emergency.create!(
  title: "Luna needs your help",
  description: "Luna was in bad shape when she was found. She deserves a happy and healthy life. Your donation will help us pay medical bills and build a playground for Luna and other shelter cats to enjoy, and provide them with essential supplies and care.",
  fundraising_goal: "480",
  animal_id: Animal.all.sample.id
)

  e_file12 = URI.open("https://images.unsplash.com/photo-1725409796872-8b41e8eca929?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  emergency12.photos.attach(io: e_file12, filename: "emergency.jpg", content_type: "image/jpg")


print "x"


puts "#{Emergency.all.size} emergencies created."


puts "Creating donations"

donor_comments = [
  "Wishing for a speedy recovery! ❤️",
  "Happy to help! Get well soon!",
  "Every life matters. Sending love!",
  "Hope this helps! Stay strong!",
  "You got this cutie patotie 💕",
  "Wishing for a successful surgery!",
  "Get well soon, sweet baby!",
  "Thank you for caring for them!",
  "Sending love and healing vibes 🐾",
  "Glad to support! Keep fighting!",
  "Hope this helps! Every bit counts!",
  "Speedy recovery, little fighter! 💖",
  "Stay strong, we’re all rooting for you!",
  "Lots of love from my furry family to yours!",
  "Hoping for the best outcome! Keep fighting!",
  "Every animal deserves a chance. Sending love!"
]


Emergency.all.each do |emergency|
  users = User.all.shuffle # shuffle so the sample is randomized
  donation_count = rand(0..[users.count, 7].min) # cap donation count by total users
  selected_users = users.take(donation_count)

  selected_users.each do |user|
    Donation.create!(
      donation_amount: rand(5..100),
      comment: donor_comments.sample,
      user_id: user.id,
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
