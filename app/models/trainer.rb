class Trainer < ApplicationRecord
  validates :identifier, presence: true, uniqueness: { case_sensitive: false }
  has_many  :ratings, class_name: TrainerBeerRating.name

  def unrated_beers
    order = 'brewerydb_breweries.location_type, brewerydb_breweries.name'
    beers = BrewerydbBeer.joins(:brewery).order(order)
                         .where(brewerydb_breweries: { location_type: %w[micro macro] })
                         .where('icon != ?', '')
    return beers if ratings.blank?
    beers.where('brewerydb_beers.external_id NOT IN (?)', ratings.map(&:beer_external_id))
  end
end
