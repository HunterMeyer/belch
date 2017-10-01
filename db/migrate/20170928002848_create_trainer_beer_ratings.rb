class CreateTrainerBeerRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainer_beer_ratings do |t|
      t.text    :beer_external_id, index: true
      t.integer :trainer_id,       index: true
      t.integer :rating

      t.timestamps
    end
  end
end
