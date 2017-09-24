require 'csv_loader'

class BrewerydbCategory < ApplicationRecord
  extend CsvLoader
  has_many :styles, primary_key: :external_id, foreign_key: :category_id, class_name: BrewerydbStyle.name

  def self.mappings
    {
      'id' =>   :external_id,
      'name' => :name
    }
  end
end
