require 'rails_helper'

RSpec.describe 'plots index' do

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
    @plot_3 = @garden.plots.create!(
      number: 47,
      size: 'Small',
      direction: 'North')

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

    @plot_1.plants << @plant_1
    @plot_1.plants << @plant_2
    @plot_2.plants << @plant_3
    @plot_2.plants << @plant_4
  end

  # User Story 1, Plots Index Page
    # As a visitor
    # When I visit the plots index page ('/plots')
    # I see a list of all plot numbers
    # And under each plot number I see names of all that plot's plants
  it 'displays all plot numbers, and all plant names planted in the plot' do
    visit plots_path
    expect(page).to have_content('All Plots')

    within "#plot-#{@plot_1.id}" do
      expect(page).to have_content("#{@plot_1.direction}: #{@plot_1.number}")
      expect(page).to have_content("All Plants Currently Planted:")
    end
    within "#plant-#{@plant_1.id}" do
      expect(page).to have_content(@plant_1.name)
    end
    within "#plant-#{@plant_2.id}" do
      expect(page).to have_content(@plant_2.name)
    end

    within "#plot-#{@plot_2.id}" do
      expect(page).to have_content("#{@plot_2.direction}: #{@plot_2.number}")
      expect(page).to have_content("All Plants Currently Planted:")
    end
    within "#plant-#{@plant_3.id}" do
      expect(page).to have_content(@plant_3.name)
    end
    within "#plant-#{@plant_4.id}" do
      expect(page).to have_content(@plant_4.name)
    end

    within "#plot-#{@flight_3.id}" do
      expect(page).to have_content("No Plants Currently Planted")
    end
  end

  # User Story 2, Remove a Plant from a Plot
    # As a visitor
    # When I visit a plot's index page
    # Next to each plant's name
    # I see a link to remove that plant from that plot
    # When I click on that link
    # I'm returned to the plots index page
    # And I no longer see that plant listed under that plot
    # (Note: you should not destroy the plant record entirely)
  it 'displays a link to remove a plant from a plot' do
    visit plots_path
    delete_link = "Remove #{@plant_1.name}"

    within "#plot-#{@plant_1.id}" do
      expect(page).to have_content(delete_link)
      click_on delete_link
    end

    visit plots_path
    expect(page).to_not have_content(@plant_1.name)
    expect(Plant.find(@plant_1.id)).to eq(@plant_1)
  end

end
