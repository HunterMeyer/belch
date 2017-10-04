class Trainer < ApplicationRecord
  validates :identifier, presence: true, uniqueness: { case_sensitive: false }
  has_many  :ratings, class_name: TrainerBeerRating.name

  before_create { identifier.downcase! }

  def unrated_beers
    order = 'brewerydb_breweries.location_type, brewerydb_breweries.name,'
    order += 'brewerydb_beers.name, brewerydb_beers.external_id'
    beers = BrewerydbBeer.joins(:brewery).order(order)
                         .where(brewerydb_breweries: { location_type: %w[micro macro] })
                         .where('icon != ?', '')
                         .where(available_id: [1, 4])
    return beers unless ratings.exists?
    beers.where('brewerydb_beers.external_id NOT IN (?)', ratings.map(&:beer_external_id))
  end

  def rated_beers
    BrewerydbBeer.where(external_id: ratings.map(&:beer_external_id))
  end
end
