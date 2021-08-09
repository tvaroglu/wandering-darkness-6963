require 'rails_helper'

RSpec.describe 'garden show page' do

  before :each do
    @garden = Garden.create!(name: 'Garden of Eaten', organic: true)
    @plot_1 = @garden.plots.create!(
      number: 25,
      size: 'Large',
      direction: 'East')
    @plot_2 = @garden.plots.create!(
      number: 36,
      size: 'Medium',
      direction: 'South')

    @plant_1 = Plant.create!(
      name: 'Bell Pepper',
      description: 'Not Spicy',
      days_to_harvest: 20)
    @plant_2 = Plant.create!(
      name: 'Jalepeno Pepper',
      description: 'Sometimes Spicy',
      days_to_harvest: 32)
    @plant_3 = Plant.create!(
      name: 'Scorpion Pepper',
      description: 'Very Spicy',
      days_to_harvest: 43)
    @plant_4 = Plant.create!(
      name: 'Ghost Pepper',
      description: 'Extremely Spicy',
      days_to_harvest: 54)
    @plant_5 = Plant.create!(
      name: 'Pepper X',
      description: 'Forget About It..',
      days_to_harvest: 666)

    @plot_1.plants << @plant_1
    @plot_1.plants << @plant_2
    @plot_1.plants << @plant_3
    @plot_2.plants << @plant_3
    @plot_2.plants << @plant_4
    @plot_2.plants << @plant_5
  end

  # User Story 3, Garden's Plants
    # As a visitor
    # When I visit a garden's show page
    # Then I see a list of plants that are included in that garden's plots
    # And I see that this list is unique (no duplicate plants)
    # And I see that this list only includes plants that take less than 100 days to harvest
  it 'displays a distinct list of plotted plants within the garden that take less than 100 days to harvest' do
    visit garden_path(@garden.id)
    expect(page).to have_content(@garden.name)
    expect(page).to have_content('All Plants Currently Planted:')
    expect(page).to have_content('(less than 100 days to harvest)')

    expected = Garden.plotted_plants_sub_100_days_to_harvest(@garden.id)

    within "#plant-#{@plant_1.id}" do
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content("Days to Harvest: #{@plant_1.days_to_harvest}")
    end
    within "#plant-#{@plant_2.id}" do
      expect(page).to have_content(@plant_2.name)
      expect(page).to have_content("Days to Harvest: #{@plant_2.days_to_harvest}")
    end
    within "#plant-#{@plant_3.id}" do
      expect(page).to have_content(@plant_3.name)
      expect(page).to have_content("Days to Harvest: #{@plant_3.days_to_harvest}")
    end
    within "#plant-#{@plant_4.id}" do
      expect(page).to have_content(@plant_4.name)
      expect(page).to have_content("Days to Harvest: #{@plant_4.days_to_harvest}")
    end

    expect(page).to_not have_content(@plant_5.name)
    expect(page).to_not have_content("Days to Harvest: #{@plant_5.days_to_harvest}")
    expect(page).to_not have_link("Remove #{@plant_5.name}")
  end

end
