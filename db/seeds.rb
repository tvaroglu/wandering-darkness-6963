# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Garden.create(name: 'Turing Community Garden', organic: true)
Garden.create(name: 'Main Street Garden', organic: false)

Garden.first.plots.create(number: 345, size: 'Medium', direction: 'North')
Garden.first.plots.create(number: 346, size: 'Large', direction: 'East')
Garden.last.plots.create(number: 878, size: 'Small', direction: 'East')
Garden.last.plots.create(number: 879, size: 'Small', direction: 'West')
