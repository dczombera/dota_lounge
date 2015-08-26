module SteamWebApi

  class Dota2
    class Refresh
      # Singleton
      class << self

        def define_refresh_method(klass)
          name = klass.name.downcase.pluralize
          define_singleton_method("refresh_#{name}") do
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
                # Let's create a new record since id wasn't found in db
                else
                  # Prepare api data for mass assignment
                  data_from_api.each do |api_data|
                    api_data.steam_id = api_data.id
                  end
                  byebug if klass == Item
                  updated_records << klass.new(api_data.to_hash)
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

    class Fetch

      # Singleton
      class << self

        def fetch_last_league_matches
          # Check if there are any records in the db
          # in order to use the last match seq number
          if last_match_seq_num = Match.order("match_seq_num DESC").try(:first).try(:match_seq_num)
            get_league_matches(last_match_seq_num + 1)
          # Database is empty so let's fill it
          else
            get_league_matches
          end
        end

        private

          # The real work horse which gets matches from the Steam Web API
          # and bulk saves them in the db.
          def get_league_matches(match_seq_num=nil)
            fetched_matches = []
            matches, status = ApiCall::get_matches_by_seq_num(match_seq_num)
            # status:
            # 1 - Success
            # 8 - 'matches_requested' must be greater than 0.
            # Ref. https://wiki.teamfortress.com/wiki/WebAPI/GetMatchHistoryBySequenceNum
            while status == 1 && matches.any?
              puts "Fetching matches..."
              matches.each do |match|
                # We only want to fetch league matches
                if match.leagueid != 0
                  # We wanna convert start time from unix time stamp to DateTime first
                  match["start_time"] = Time.at(match["start_time"]).utc
                  fetched_matches << Match.new(match.to_hash)
                end
              end
              puts "Matches fetched: #{fetched_matches.count}"
              puts "Saving matches into db..."
              Match.import(fetched_matches, validate: false) if fetched_matches.any?
              puts "Done!"
              fetched_matches.clear
              # Let's see if there are more matches to fetch. Since we don't want to save
              # any records twice we query the API using highest seq number + 1
              next_seq_num = matches.map(&:match_seq_num).max + 1
              puts "Next match seq number: #{next_seq_num}"
              matches, status = ApiCall::get_matches_by_seq_num(next_seq_num)
            end
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
          api_result = Hashie::Mash.new(get("/IEconDOTA2_205790/GetGameItems/V001/?key=#{ENV["steam_web_api_key"]}&language=en_us"))
          return [api_result.result.items, api_result.result.status]
        end

        def get_matches_by_seq_num(match_seq_num=nil)
          api_result = Hashie::Mash.new(
              get("/IDOTA2Match_570/GetMatchHistoryBySequenceNum/v1?key=#{ENV["steam_web_api_key"]}&start_at_match_seq_num=#{match_seq_num}&language=en_us"))
          return [api_result.result.matches, api_result.result.status]
        end
      end
    end
  end
end