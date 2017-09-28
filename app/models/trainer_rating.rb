class TrainerRating < ApplicationRecord
  belongs_to :trainer
  belongs_to :beer, primary_key: :external_id, foreign_key: :beer_external_id, class_name: BrewerydbBeer.name
end
