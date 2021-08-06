class GardenBedsController < ApplicationController

  def destroy
    garden_bed = GardenBed.find_by(plant_id: params[:id])
    garden_bed.destroy
    redirect_to plots_path
  end

end
