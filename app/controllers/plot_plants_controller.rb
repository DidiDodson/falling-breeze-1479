class PlotPlantsController < ApplicationController

  def destroy
    plot = Plot.find(params[:id])
    plant = plot.plants.find do |plant|
      plant.id
    end

    PlotPlant.delete(plot: plot, plant: plant)

    redirect_to plots_path
  end
end
