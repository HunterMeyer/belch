require 'rails_helper'

describe Trainer do
  let(:trainer) { FactoryGirl.create(:trainer) }

  context 'beer ratings' do
    let(:ratings)       { trainer.ratings }
    let(:unrated_beers) { trainer.unrated_beers }

    %i[beer_1 beer_2 beer_3 beer_4 beer_5].each do |beer_name|
      let!(beer_name) { FactoryGirl.create(:brewerydb_beer, name: beer_name) }
    end

    before do
      trainer.ratings.create(beer: beer_1, rating: 1)
      trainer.ratings.create(beer: beer_3, rating: -1)
    end

    describe '#unrated_beers' do
      it 'returns beers that have not been rated' do
        expect(unrated_beers.count).to eq 3
        expect(unrated_beers.first).to be_a BrewerydbBeer
      end
    end

    describe '#ratings' do
      it 'returns their beer ratings' do
        expect(ratings.count).to eq 2
        expect(ratings.first).to be_a TrainerBeerRating
      end
    end
  end
end
