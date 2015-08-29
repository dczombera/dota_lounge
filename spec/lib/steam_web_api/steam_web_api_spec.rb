require 'rails_helper'

RSpec.describe SteamWebApi::Dota2 do
  describe "SteamWebApi::Dota2::Refresh" do

    context"refreshes hero records in db" do
      let(:api_heroes) { SteamWebApi::Dota2::ApiCall::get_heroes.first }

      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_heroes).and_return([api_heroes.deep_dup, 200])
        SteamWebApi::Dota2::Refresh::refresh_heroes
      end

      it "creates new records in db" do
        expect(Hero.all.count).to eq(api_heroes.count)
      end

      it "updates existing record in db" do
        api_heroes.first["localized_name"] = "Chuck Norris"
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_heroes).and_return([api_heroes.deep_dup, 200])
        expect {
          SteamWebApi::Dota2::Refresh::refresh_heroes
        }.to change{ Hero.find_by(steam_id: api_heroes.first.id).localized_name }
      end
    end

    context "refreshes item records in db" do
      let(:api_items) { SteamWebApi::Dota2::ApiCall::get_items.first }

      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_items).and_return([api_items.deep_dup, 200])
        SteamWebApi::Dota2::Refresh::refresh_items
      end

      it "creates new records in db" do
        expect(Item.all.count).to eq(api_items.count)
      end

      it "updates existing record in db" do
        api_items.first["name"] = "Millennium Falcon"
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_items).and_return([api_items.deep_dup, 200])
        expect {
          SteamWebApi::Dota2::Refresh::refresh_items
        }.to change{ Item.find_by(steam_id: api_items.first.id).name }
      end
    end

    context "refreshes abilities in db" do
      let(:api_abilities) { SteamWebApi::Dota2::ApiCall::get_abilities.first }

      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_abilities).and_return([api_abilities.deep_dup, 200])
        SteamWebApi::Dota2::Refresh::refresh_abilities
      end

      it "creates new records in db" do
        expect(Ability.all.count).to eq(api_abilities.count)
      end

      it "updates existing record in db" do
        api_abilities.first["localized_name"] = "Berserker's Call"
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_abilities).and_return([api_abilities.deep_dup, 200])
        expect {
          SteamWebApi::Dota2::Refresh::refresh_abilities
        }.to change{ Ability.find_by(steam_id: api_abilities.first.id).localized_name }
      end
    end
  end

  describe "SteamWebApi::Dota2::Fetch" do

    context "fetches matches" do
      let!(:api_match) { SteamWebApi::Dota2::ApiCall::get_matches_by_seq_num.first }
      let!(:api_match2) { SteamWebApi::Dota2::ApiCall::get_matches_by_seq_num(api_match.map(&:match_seq_num).max + 1).first }
      let(:api_match_count) do
        api_match.select { |match| match.leagueid != 0 }.count
      end
      let(:api_match2_count) do
        api_match2.select { |match| match.leagueid != 0 }.count
      end

      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_matches_by_seq_num).and_return([api_match, 1], [[], 500])
        SteamWebApi::Dota2::Fetch.fetch_last_league_matches
      end

      it "creates new records in empty db" do
        expect(Match.all.count).to eq(api_match_count)
      end

      it "creates new records in db with records" do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_matches_by_seq_num).and_return([api_match2, 1], [[], 500])
        SteamWebApi::Dota2::Fetch.fetch_last_league_matches
        expect(Match.all.count).to eq(api_match_count + api_match2_count)
      end
    end

    context "fetches leagues" do
      let(:leagues) do
        data = { "leagues": [
          {
            "name"=>"#DOTA_Item_Dota_2_Just_For_Fun",
            "leagueid"=>1212,
            "description"=>"#DOTA_Item_Desc_Dota_2_Just_For_Fun",
            "tournament_url"=>"https://binarybeast.com/xDOTA21404228/",
            "itemdef"=>10541
          },
          {
            "name"=>"#DOTA_Item_joinDOTA_League_Season_3",
            "leagueid"=>1640,
            "description"=>"#DOTA_Item_Desc_joinDOTA_League_Season_3",
            "tournament_url"=>"http://www.joindota.com/en/leagues/",
            "itemdef"=>10742
          }
        ]}
        Hashie::Mash.new(data).leagues
      end



      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_leagues).and_return(leagues)
        SteamWebApi::Dota2::Fetch.fetch_leagues
      end

      it "creates new records in empty db" do
        expect(League.all.count).to eq(leagues.count)
      end

      it "updates records in db" do
        leagues.first["name"] = "ESL One"
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_leagues).and_return(leagues)
        expect {
          SteamWebApi::Dota2::Fetch.fetch_leagues
        }.to change{ League.find_by(leagueid: leagues.first.leagueid).name }
      end
    end

    context "fetches live league matches" do
      let(:live_match) { [Hashie::Mash.new(attributes_for(:live_league_match))] }

      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_live_league_matches).and_return([live_match, 200])
        SteamWebApi::Dota2::Fetch.fetch_live_league_matches
      end

      it "creates new record for finished live match" do
        live_match.first.match_id += 1
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_live_league_matches).and_return([live_match, 200])
        expect {
          SteamWebApi::Dota2::Fetch.fetch_live_league_matches
        }.to change(LiveLeagueMatch, :count).by(1)
      end
    end
  end
end
