require 'rails_helper'

RSpec.describe 'application' do
  it 'displays a link to the flights index' do
    visit '/'
    expect(page).to have_content('B2 Assessment')

    expect(page).to have_link('Plots Index')
    click_link('Plots Index')

    expect(current_path).to eq(plots_path)
  end

end
