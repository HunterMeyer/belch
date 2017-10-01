FactoryGirl.define do
  sequence(:identifier) { |num| "id-#{num}" }

  factory :brewerydb_beer do
    external_id { generate(:identifier) }
    name 'Pink Ribbon Saison'
    abv  '6.2'
    icon 'https://s3.amazonaws.com/brewerydbapi/beer/AynUzk/upload_rdzSpd-large.png'
  end

  factory :trainer do
    identifier
  end
end
