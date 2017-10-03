class AddCategoryRootNameToBrewerydbBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :brewerydb_beers, :category_root_name, :text
  end
end
