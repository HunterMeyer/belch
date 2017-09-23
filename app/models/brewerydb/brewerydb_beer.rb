class BrewerydbBeer < ApplicationRecord
  def self.load_from_csv(path)
    RemoteTable.new(path, headers: true).rows.each do |row|
      next if exists?(external_id: row['id'])
      create!(row.replace_keys!(mappings))
    end
  end

  def self.mappings # them => us
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
