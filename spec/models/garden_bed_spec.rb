require 'rails_helper'

RSpec.describe GardenBed do
  describe 'relationships' do
    it {should belong_to(:plot)}
    it {should belong_to(:plant)}
  end

  describe 'methods' do
    it "can return a specific garden bed to destroy based on the plant and plot id's" do
      garden = Garden.create!(name: 'Garden of Eaten', organic: true)
      plot_1 = garden.plots.create!(
        number: 25,
        size: 'Large',
        direction: 'East')
      plot_2 = garden.plots.create!(
        number: 36,
        size: 'Medium',
        direction: 'South')

      plant_1 = Plant.create!(
        name: 'Bell Pepper',
        description: 'Not Spicy',
        days_to_harvest: 20)
      plant_2 = Plant.create!(
        name: 'Jalepeno Pepper',
        description: 'Sometimes Spicy',
        days_to_harvest: 32)

      garden_bed_1 = GardenBed.create!(plot: plot_1, plant: plant_1)
      garden_bed_2 = GardenBed.create!(plot: plot_1, plant: plant_2)
      garden_bed_3 = GardenBed.create!(plot: plot_2, plant: plant_1)
      garden_bed_4 = GardenBed.create!(plot: plot_2, plant: plant_2)

      expect(GardenBed.plant_to_remove(plant_1.id, plot_1.id)).to eq(garden_bed_1)
      expect(GardenBed.plant_to_remove(plant_2.id, plot_1.id)).to eq(garden_bed_2)
      expect(GardenBed.plant_to_remove(plant_1.id, plot_2.id)).to eq(garden_bed_3)
      expect(GardenBed.plant_to_remove(plant_2.id, plot_2.id)).to eq(garden_bed_4)
    end
  end
end
