module SteamWebApi

  class Dota2
      class Refresh
      # Singleton
      class << self

        def define_refresh_method(klass)
          name = klass.name.downcase.pluralize
          define_singleton_method(name) do
            # used for activerecord-import for bulk inserting data
            updated_records = []
            data_from_api, status =  ApiCall.send "get_#{name}"
            # Check if API call was successful
            if status == 200
              records_from_db = klass.all.try(:index_by, &:steam_id)

              data_from_api.map do |api_data|
                if db_record = records_from_db[api_data.id]
                  db_record.update_status(api_data)
                  db_record.save if db_record.changed?
                else
                  # TODO: needs to be refactored because it's too specific
                  # Let's create a new record since id wasn't found in db
                  if klass.name == "Hero"
                    updated_records << klass.new(steam_id: api_data.id, name: api_data.name, localized_name: api_data.localized_name)
                  else
                    updated_records << klass.new(steam_id: api_data.id, name: api_data.name, cost: api_data.cost,
                                              secret_shop: api_data.secret_shop, side_shop: api_data.side_shop,
                                              recipe: api_data.recipe)
                  end
                end
              end
            end
            # Save records in db using activerecord-import method
            klass.import updated_records if updated_records.any?
          end
        end
      end

      define_refresh_method Hero # define "heroes" method
      define_refresh_method Item # define "items"" method
    end

    # Singleton class used for Api calls of the Steam Web Api
    class ApiCall
      include HTTParty
      base_uri 'api.steampowered.com'

      # Singleton
      class << self

        # Returns an array of Hashie::Mash objects representing the heroes
        # and int providing the status of the api call.
        def get_heroes
          api_result = Hashie::Mash.new(get("/IEconDOTA2_570/GetHeroes/v0001/?key=#{ENV["steam_web_api_key"]}&language=en_us"))
          return [api_result.result.heroes, api_result.result.status]
        end

        # Returns an array of Hashie::Mash objects representing the heroes
        # and int providing the status of the api call.
        def get_items
          api_result = Hashie::Mash.new(get("/IEconDOTA2_205790/GetGameItems/V001/?key=#{ENV["steam_web_api_key"]}&language=en_us"))
          return [api_result.result.items, api_result.result.status]
        end
      end
    end
  end
end