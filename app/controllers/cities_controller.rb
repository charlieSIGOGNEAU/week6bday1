class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @name = @city.name
    @gossips = Gossip.joins(user: :city).where(cities: { id: params[:id] })
  end
end
