class CreateBrewerydbBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :brewerydb_breweries do |t|
      t.text :external_id
      t.text :name
      t.text :name_short_display
      t.text :description
      t.text :website
      t.text :is_organic
      t.text :status
      t.text :street_address
      t.text :locality
      t.text :region
      t.text :postal_code
      t.text :phone
      t.text :latitude
      t.text :longitude
      t.text :is_closed
      t.text :is_primary
      t.text :open_to_public
      t.text :location_type
      t.text :location_type_display
      t.text :country_iso_code

      t.timestamps
    end
  end
end
