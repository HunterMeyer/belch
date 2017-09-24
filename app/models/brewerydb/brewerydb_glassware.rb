require 'csv_loader'

class BrewerydbGlassware < ApplicationRecord
  extend CsvLoader
  has_many :beers, primary_key: :external_id, foreign_key: :glassware_id, class_name: BrewerydbBeer.name

  def self.mappings
    {
      'id' =>   :external_id,
      'name' => :name
    }
  end
end
