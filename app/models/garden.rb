class Garden < ApplicationRecord
  has_many :plots

  def self.plotted_plants_sub_100_days_to_harvest(garden_id)
    GardenBed.select("DISTINCT plants.id, plants.name AS name,
      plants.days_to_harvest AS days_to_harvest")
      .joins("INNER JOIN plots ON garden_beds.plot_id = plots.id")
      .joins("INNER JOIN gardens ON plots.garden_id = gardens.id")
      .joins("INNER JOIN plants ON garden_beds.plant_id = plants.id")
      .where("gardens.id = ?", garden_id)
      .where("plants.days_to_harvest < ?", 100)
  end

end
