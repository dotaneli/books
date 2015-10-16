# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.create(name: 'Apartment for rent', author: "Zibi", number_of_pages: 15, price: 11.99)
Book.create(name: 'The Generous Tree', author: "Yoda", number_of_pages: 8, price: 7.99)
