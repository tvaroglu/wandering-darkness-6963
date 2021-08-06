require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'methods' do
    it 'can return a distinct list of plotted plants within the garden that take less than 100 days to harvest' do
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
      plant_3 = Plant.create!(
        name: 'Scorpion Pepper',
        description: 'Very Spicy',
        days_to_harvest: 43)
      plant_4 = Plant.create!(
        name: 'Ghost Pepper',
        description: 'Extremely Spicy',
        days_to_harvest: 54)
      plant_5 = Plant.create!(
        name: 'Pepper X',
        description: 'Forget About It..',
        days_to_harvest: 666)

      plot_1.plants << plant_1
      plot_1.plants << plant_2
      plot_1.plants << plant_3
      plot_2.plants << plant_3
      plot_2.plants << plant_4
      plot_2.plants << plant_5

      expected = Garden.plotted_plants_sub_100_days_to_harvest(garden.id)

      expect(expected.length).to eq(4)
      expect(expected[0].name).to eq(plant_1.name)
      expect(expected[0].days_to_harvest).to eq(plant_1.days_to_harvest)
      expect(expected[1].name).to eq(plant_2.name)
      expect(expected[1].days_to_harvest).to eq(plant_2.days_to_harvest)
      expect(expected[2].name).to eq(plant_3.name)
      expect(expected[2].days_to_harvest).to eq(plant_3.days_to_harvest)
      expect(expected[3].name).to eq(plant_4.name)
      expect(expected[3].days_to_harvest).to eq(plant_4.days_to_harvest)
    end
  end

end
