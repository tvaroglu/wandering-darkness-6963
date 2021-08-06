class GardenBedsController < ApplicationController

  def create
  end

  def destroy
    require "pry"; binding.pry
    garden_bed = GardenBed.find_by(plant_id: params[:id])
    garden_bed.destroy
    redirect_to plots_path
  end

end
