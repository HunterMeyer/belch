class Trainer < ApplicationRecord
  validates :identifier, presence: true, uniqueness: { case_sensitive: false }
  has_many  :ratings, class_name: TrainerRating.name

  def unrated_beers
    BrewerydbBeer.where('external_id NOT IN (?)', ratings.map(&:beer_external_id))
  end
end