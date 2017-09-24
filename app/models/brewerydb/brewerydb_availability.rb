require 'csv_loader'

class BrewerydbAvailability < ApplicationRecord
  extend CsvLoader
  has_many :beers, primary_key: :external_id, foreign_key: :available_id, class_name: BrewerydbBeer.name

  def self.mappings
    {
      'id' =>          :external_id,
      'name' =>        :name,
      'description' => :description
    }
  end
end
