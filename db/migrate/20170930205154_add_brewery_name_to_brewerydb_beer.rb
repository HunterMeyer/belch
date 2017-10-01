class AddBreweryNameToBrewerydbBeer < ActiveRecord::Migration[5.0]
  def change
    add_column :brewerydb_beers, :brewery_name, :text
  end
end
