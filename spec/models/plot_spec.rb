require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it {should have_many(:garden_beds)}
    it {should have_many(:plants).through(:garden_beds)}
  end

  describe 'methods' do
    it 'can determine if plants are planted in the plot' do
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

      plot_1.plants << plant_1
      plot_1.plants << plant_2

      expect(plot_1.has_plants?).to be true
      expect(plot_2.has_plants?).to be false
    end
  end

end
