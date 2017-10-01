class Trainer < ApplicationRecord
  validates :identifier, presence: true, uniqueness: { case_sensitive: false }
  has_many  :ratings, class_name: TrainerBeerRating.name

  def unrated_beers
    return BrewerydbBeer if ratings.blank?
    BrewerydbBeer.where('external_id NOT IN (?)', ratings.map(&:beer_external_id))
  end
end
