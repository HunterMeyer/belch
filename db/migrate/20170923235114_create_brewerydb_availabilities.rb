class CreateBrewerydbAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :brewerydb_availabilities do |t|
      t.text :external_id
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
