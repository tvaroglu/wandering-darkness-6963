# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
GardenBed.destroy_all
Plant.destroy_all
Plot.destroy_all
Garden.destroy_all

# Gardens
garden_1 = Garden.create!(name: 'Garden of Eaten', organic: true)

# Plots
plot_1 = garden_1.plots.create!(
  number: 25,
  size: 'Large',
  direction: 'East')
plot_2 = garden_1.plots.create!(
  number: 36,
  size: 'Medium',
  direction: 'South')
plot_3 = garden_1.plots.create!(
  number: 47,
  size: 'Small',
  direction: 'North')

# Plants
plant_1 = Plant.create!(
  name: 'Bell Pepper',
  description: 'Not Spicy',
  days_to_harvest: 20)
plant_2 = Plant.create!(
  name: 'Jalepeno Pepper',
  description: 'Sometimes Spicy',
  days_to_harvest: 32)
plant_3 = Plant.create!(
  name: 'Scorpion Pepper',
  description: 'Very Spicy',
  days_to_harvest: 43)
plant_4 = Plant.create!(
  name: 'Ghost Pepper',
  description: 'Extremely Spicy',
  days_to_harvest: 54)
plant_5 = Plant.create!(
  name: 'Carolina Reaper Pepper',
  description: 'Inhumanly Spicy',
  days_to_harvest: 65)
plant_6 = Plant.create!(
  name: 'Pepper X',
  description: 'Forget About It..',
  days_to_harvest: 666)

# Garden Beds
plot_1.plants << plant_1
plot_1.plants << plant_2
plot_1.plants << plant_3
plot_2.plants << plant_3
plot_2.plants << plant_4
