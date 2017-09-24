require 'csv_loader'

class BrewerydbBeer < ApplicationRecord
  extend CsvLoader
  belongs_to :availability, primary_key: :external_id, foreign_key: :available_id, class_name: BrewerydbAvailability.name
  belongs_to :brewery,      primary_key: :external_id, class_name: BrewerydbBrewery.name
  belongs_to :glassware,    primary_key: :external_id, class_name: BrewerydbGlassware.name
  belongs_to :style,        primary_key: :external_id, class_name: BrewerydbStyle.name

  def self.mappings
    {
      'id' =>                        :external_id,
      'name' =>                      :name,
      'nameDisplay' =>               :name_display,
      'description' =>               :description,
      'abv' =>                       :abv,
      'ibu' =>                       :ibu,
      'availableId' =>               :available_id,
      'styleId' =>                   :style_id,
      'isOrganic' =>                 :is_organic,
      'status' =>                    :status,
      'glasswareId' =>               :glassware_id,
      'foodPairings' =>              :food_pairings,
      'originalGravity' =>           :original_gravity,
      'servingTemperature' =>        :serving_temperature,
      'servingTemperatureDisplay' => :serving_temperature_display,
      'updateDate' =>                :update_date,
      'createDate' =>                :create_date,
      'icon' =>                      :icon,
      'breweryId' =>                 :brewery_id
    }
  end
end
