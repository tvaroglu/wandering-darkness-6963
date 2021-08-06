require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it {should have_many(:garden_beds)}
    it {should have_many(:plots).through(:garden_beds)}
  end

end
