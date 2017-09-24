require 'csv_loader'

class BrewerydbBrewery < ApplicationRecord
  extend CsvLoader

  def self.mappings # them => us
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
