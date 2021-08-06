class GardenBedsController < ApplicationController

  def create
  end

  def destroy
    garden_bed = GardenBed.find_by(plot_id: params[:plot_id])
    garden_bed.destroy
    redirect_to plots_path
  end

end
