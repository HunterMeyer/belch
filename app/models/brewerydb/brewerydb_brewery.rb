require 'csv_loader'

class BrewerydbBrewery < ApplicationRecord
  extend CsvLoader
  has_many :beers,     primary_key: :external_id, foreign_key: :brewery_id,  class_name: BrewerydbBeer.name
  has_many :locations, primary_key: :external_id, foreign_key: :location_id, class_name: BrewerydbLocation.name

  def self.mappings
    {
      'id' =>                  :external_id,
      'name' =>                :name,
      'nameShortDisplay' =>    :name_short_display,
      'description' =>         :description,
      'website' =>             :website,
      'isOrganic' =>           :is_organic,
      'status' =>              :status,
      'streetAddress' =>       :street_address,
      'locality' =>            :locality,
      'region' =>              :region,
      'postalCode' =>          :postal_code,
      'phone' =>               :phone,
      'latitude' =>            :latitude,
      'longitude' =>           :longitude,
      'isClosed' =>            :is_closed,
      'isPrimary' =>           :is_primary,
      'openToPublic' =>        :open_to_public,
      'locationType' =>        :location_type,
      'locationTypeDisplay' => :location_type_display,
      'countryIsoCode' =>      :country_iso_code,
      'updateDate' =>          :update_date,
      'createDate' =>          :create_date
    }
  end
end
