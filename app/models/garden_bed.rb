class GardenBed < ApplicationRecord
  belongs_to :plot
  belongs_to :plant

  def self.plant_to_remove(plant_id, plot_id)
    where(plant_id: plant_id)
    .where(plot_id: plot_id)
    .first
  end

end
