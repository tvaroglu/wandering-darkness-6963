class Plot < ApplicationRecord
  belongs_to :garden

  has_many :garden_beds
  has_many :plants, through: :garden_beds

end
