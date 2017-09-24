class CreateBrewerydbLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :brewerydb_locations do |t|
      t.text :external_id
      t.text :name
      t.text :street_address
      t.text :extended_address
      t.text :locality
      t.text :region
      t.text :postal_code
      t.text :phone
      t.text :website
      t.text :hours_of_operation
      t.text :hours_of_operation_explicit
      t.text :hours_of_operation_notes
      t.text :tour_info
      t.text :timezone_id
      t.text :latitude
      t.text :longitude
      t.text :is_primary
      t.text :in_planning
      t.text :is_closed
      t.text :open_to_public
      t.text :location_type
      t.text :location_type_display
      t.text :country_iso_code
      t.text :year_opened
      t.text :brewery_id
      t.text :status
      t.text :update_date

      t.timestamps
    end
  end
end
