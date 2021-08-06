class Plant < ApplicationRecord
  has_many :garden_beds
  has_many :plots, through: :garden_beds

end
