require 'csv_loader'

class BrewerydbGlassware < ApplicationRecord
  extend CsvLoader

  def self.mappings
    {
      'id' =>   :external_id,
      'name' => :name
    }
  end
end
