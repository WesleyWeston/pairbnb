# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users

User.create(name: "Joel", email: "joel@joel.com", password: "hellojoel", role: 1)

user = {}
user['password'] = 'asdf'


ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.name 
    user['email'] = Faker::Internet.email
    user['avatar'] = Faker::Avatar.image("https://www.belr.com/wp-content/uploads/2017/06/avatar-placeholder-generic-1.jpg")

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name
    listing['description'] = Faker::Hipster.sentence
    listing['address'] = Faker::Address.full_address
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    listing['accomodation_type'] = ["Entire", "Private room", "Shared room"].sample
    listing['bedrooms'] = rand(0..5)
    listing['occupant_limit'] = rand(1..10)
    listing['user_id'] = uids.sample
    listing['price'] = rand(20..500)
    listing['images'] = Faker::Avatar.image("https://media.architecturaldigest.com/photos/5a39377f38bb817b7ffe1dd7/4:3/w_384/airbnb-tips-greenwich-village-apt.jpg")

    Listing.create(listing)
  end


  booking = {}
  uids = []
  User.all.each { |u| uids << u.id}
  lids = []
  Listing.all.each { |l| lids << l.id}

  20.times do 
    booking['user_id'] = uids.sample
    booking['listing_id'] = lids.sample
    booking['start_date'] = Faker::Date.forward(100)
    booking['end_date'] = booking['start_date'] + rand(0..24)

    Booking.create(booking)
  end

end