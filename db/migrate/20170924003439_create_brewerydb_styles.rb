class CreateBrewerydbStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :brewerydb_styles do |t|
      t.text :external_id
      t.text :category_id
      t.text :name
      t.text :short_name
      t.text :description
      t.text :ibu_min
      t.text :ibu_max
      t.text :abv_min
      t.text :abv_max
      t.text :srm_min
      t.text :srm_max
      t.text :og_min
      t.text :fg_min
      t.text :fg_max

      t.timestamps
    end
  end
end
