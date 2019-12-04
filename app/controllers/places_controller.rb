class PlacesController < ApplicationController
  def index
    @places = Place.geocoded
      @markers = @places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { place: place }),
        image_url: helpers.asset_url('octopus.png')
      }
    end
  end
end
