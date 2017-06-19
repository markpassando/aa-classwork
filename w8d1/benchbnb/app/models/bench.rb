class Bench < ApplicationRecord
  validates :description, :lat, :long, presence: true

  def self.in_bounds(bounds)
    Bench.where(lat: bounds.northEast.lat..bounds.southWest.lat, long: bounds.northEast.lng..bounds.southWest.lng)
  end
end
