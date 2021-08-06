require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it {should have_many(:garden_beds)}
    it {should have_many(:plants).through(:garden_beds)}
  end
end
