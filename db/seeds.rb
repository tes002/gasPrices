# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create({
	name: "user1",
        email:"tt@gmail.com",
        latitude: 32.87125,
        longitude: -117.23339
})

GasStation.create({
	name: "Mobil",
	address: "3233 La Jolla Villagr Dr, La Jolla, CA 92037",
	latitude: 32.87125,
	longitude: -117.23339,
	price: 4.1
})
