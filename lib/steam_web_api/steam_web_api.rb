module SteamWebApi

  class Dota2
      class Refresh
      # Singleton
      class << self

        def heroes
          # used for activerecord-import for bulk inserting data
          updated_heroes = []
          heroes_from_api, status = ApiCall::get_heroes
          # Check if API call was successful
          if status == 200
            heroes_from_db = Hero.all.try(:index_by, &:steam_id)
            
            heroes_from_api.map do |api_hero|
              if db_hero = heroes_from_db[api_hero.id]
                db_hero.update_status(api_hero)
                db_hero.save if db_hero.changed?
              else
                # Let's create a new hero since id wasn't found in db
                updated_heroes << Hero.new(steam_id: api_hero.id, name: api_hero.name, localized_name: api_hero.localized_name)
              end
            end
            # Save records in db using activerecord-import method
            Hero.import updated_heroes if updated_heroes.any?
          end
        end

        def items

        end
      end
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

        end
      end
    end
  end
end