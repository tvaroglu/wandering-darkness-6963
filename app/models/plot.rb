class Plot < ApplicationRecord
  belongs_to :garden

  has_many :garden_beds
  has_many :plants, through: :garden_beds

  def garden_name
    garden.name
  end

  def has_plants?
    plants.count > 0
  end

end
