require 'csv_loader'

class BrewerydbAvailability < ApplicationRecord
  extend CsvLoader

  def self.mappings # them => us
    {
      'id' =>          :external_id,
      'name' =>        :name,
      'description' => :description
    }
  end
end
