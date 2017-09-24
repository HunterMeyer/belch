class CreateBrewerydbCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :brewerydb_categories do |t|
      t.text :external_id
      t.text :name

      t.timestamps
    end
  end
end
