require 'csv_loader'

class BrewerydbStyle < ApplicationRecord
  extend CsvLoader

  def self.mappings
    {
      'id' =>          :external_id,
      'categoryId' =>  :category_id,
      'name' =>        :name,
      'shortName' =>   :short_name,
      'description' => :description,
      'ibuMin' =>      :ibu_min,
      'ibuMax' =>      :ibu_max,
      'abvMin' =>      :abv_min,
      'abvMax' =>      :abv_max,
      'srmMin' =>      :srm_min,
      'srmMax' =>      :srm_max,
      'ogMin' =>       :og_min,
      'fgMin' =>       :fg_min,
      'fgMax' =>       :fg_max
    }
  end
end
