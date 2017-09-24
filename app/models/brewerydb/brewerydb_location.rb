require 'csv_loader'

class BrewerydbLocation < ApplicationRecord
  extend CsvLoader

  def self.mappings
    {
      'id' =>                       :external_id,
      'name' =>                     :name,
      'streetAddress' =>            :street_address,
      'extendedAddress' =>          :extended_address,
      'locality' =>                 :locality,
      'region' =>                   :region,
      'postalCode' =>               :postal_code,
      'phone' =>                    :phone,
      'website' =>                  :website,
      'hoursOfOperation' =>         :hours_of_operation,
      'hoursOfOperationExplicit' => :hours_of_operation_explicit,
      'hoursOfOperationNotes' =>    :hours_of_operation_notes,
      'tourInfo' =>                 :tour_info,
      'timezoneId' =>               :timezone_id,
      'latitude' =>                 :latitude,
      'longitude' =>                :longitude,
      'isPrimary' =>                :is_primary,
      'inPlanning' =>               :in_planning,
      'isClosed' =>                 :is_closed,
      'openToPublic' =>             :open_to_public,
      'locationType' =>             :location_type,
      'locationTypeDisplay' =>      :location_type_display,
      'countryIsoCode' =>           :country_iso_code,
      'yearOpened' =>               :year_opened,
      'breweryId' =>                :brewery_id,
      'status' =>                   :status,
      'updateDate' =>               :update_date
    }
  end
end
