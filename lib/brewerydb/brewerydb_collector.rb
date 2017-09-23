# api_key_a: af11574a2dc5da6624d4d275366c97cb
# api_key_b: e30b3efd41b83ee12d1edfe855653539
class BrewerydbCollector
  module Beer
    def setup
      @raw       = []
      @beers     = []
      @styles    = []
      @avails    = []
      @cats      = []
      @glass     = []
      @breweries = []
      @page_num  = 0
    end

    def collect_all(api_key)
      (1..9).each do |id|
        collect_data(id, api_key)
        @page_num = 0 # reset page num
      end
      true
    end

    def collect_data(available_id, api_key)
      base_url = "http://api.brewerydb.com/v2/beers?key=#{api_key}&availableId=#{available_id}&withBreweries=Y&p="
      while true
        url = base_url + "#{@page_num += 1}"
        ap @page_num
        data = JSON.parse(HTTParty.get(url).response.body)['data']
        break if data.blank?
        data.each do |beer|
          begin
            @raw << beer
            beer_to_record = beer.slice(*%w(id name nameDisplay description abv ibu availableId styleId isOrganic status glasswareId foodPairings originalGravity servingTemperature servingTemperatureDisplay year beerVariationId updateDate createDate))
            if beer['labels'].present? && beer['labels']['large'].present?
              beer_to_record.merge!('icon' => beer['labels']['large'])
            end

            if beer['availableId'].present? && @avails.find { |avail| avail['id'] == beer['availableId'] }.blank?
              @avails << beer['available'].slice(*%w(id name description))
            end

            if beer['glasswareId'].present? && @glass.find { |glass| glass['id'] == beer['glasswareId'] }.blank?
              @glass << beer['glass'].slice(*%w(id name))
            end

            if beer['styleId'].present? && @styles.find { |style| style['id'] == beer['styleId'] }.blank?
              @styles << beer['style'].slice(*%w(id categoryId name shortName description ibuMin ibuMax abvMin abvMax srmMin srmMax ogMin fgMin fgMax))
            end

            if beer['style'].present? && @cats.find { |cat| cat['id'] == beer['style']['categoryId'] }.blank?
              @cats << beer['style']['category'].slice(*%w(id name))
            end

            if beer['breweries'].present?
              brewery = beer['breweries'].first
              beer_to_record.merge!('breweryId' => brewery['id'])
              if @breweries.find { |brew| brew['id'] == brewery['id'] }.blank?
                company = brewery.slice(*%w(id name nameShortDisplay description website isOrganic status))
                if brewery['locations'].present?
                  location = brewery['locations'].find { |loc| loc['isPrimary'] == 'Y' } || brewery['locations'].first
                  location = location.slice(*%w(streetAddress established locality region postalCode phone latitude longitude isClosed isPrimary openToPublic locationType locationTypeDisplay countryIsoCode))
                  @breweries << company.merge(location)
                else
                  @breweries << company
                end
              end
            end

            @beers << beer_to_record 
          rescue => ex
            binding.pry
          end
        end
      end
    end

    def format_and_write_file(data, name)
      headers = data.map(&:keys).sort { |a, b| b.size <=> a.size }.first
      to_file(headers, data, name)
    end

    def write_data
      format_and_write_file(@beers, 'beers')
      format_and_write_file(@styles, 'styles')
      format_and_write_file(@avails, 'availabilities')
      format_and_write_file(@cats, 'categories')
      format_and_write_file(@glass, 'glasswares')
      format_and_write_file(@breweries, 'breweries')
    end

    def to_file(headers, data, file_name)
      CSV.open("/Users/huntermeyer/Desktop/belch/brewerydb-com/#{file_name}.csv", 'wb') do |csv|
        csv << headers
        data.each do |datum|
          csv << Hash[headers.map { |x| [x, nil] }].merge(datum).values_at(*headers)
        end
      end
      true
    end
  end

  module Location
    def locations
      @locations ||= []
    end

    def headers
      %w(id name streetAddress extendedAddress locality region postalCode phone website hoursOfOperation hoursOfOperationExplicit hoursOfOperationNotes tourInfo timezoneId latitude longitude isPrimary inPlanning isClosed openToPublic locationType locationTypeDisplay countryIsoCode yearOpened breweryId status updateDate)
    end

    def states
      ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'District of Columbia', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
    end

    def collect_all_locations(api_key)
      states.each do |state|
        collect_locations(api_key, state)
      end
      true
    end

    def collect_locations(api_key, state)
      page_num = 0
      base_url = "http://api.brewerydb.com/v2/locations?key=#{api_key}&region=#{CGI::escape(state)}&countryIsoCode=US&withBreweries=Y&p="
      while true
        url = base_url + "#{page_num += 1}"
        ap page_num
        data = JSON.parse(HTTParty.get(url).response.body)['data']
        break if data.blank?
        data.each do |location|
          begin
            result = location.values_at(*headers)
            locations << result
          rescue => ex
            binding.pry
          end
        end
      end
    end

    def write_location_data
      CSV.open('/Users/huntermeyer/Desktop/belch/brewerydb-com/locations.csv', 'wb') do |csv|
        csv << headers
        locations.each do |location|
          csv << location
        end
      end
      true
    end
  end
end
