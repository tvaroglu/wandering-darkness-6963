class GardenBedsController < ApplicationController

  def destroy
    garden_bed = GardenBed.plant_to_remove(params[:id], params[:format])
    garden_bed.destroy
    redirect_to plots_path
  end

end
