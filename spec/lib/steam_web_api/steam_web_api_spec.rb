require 'rails_helper'

RSpec.describe SteamWebApi::Dota2 do
  describe "SteamWebApi::Dota2::Refresh" do

    context"refreshes hero records in db" do
      let(:api_heroes) { SteamWebApi::Dota2::ApiCall::get_heroes.first }

      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_heroes).and_return([api_heroes, 200])
        SteamWebApi::Dota2::Refresh::refresh_heroes
      end

      it "creates new records in db" do
        expect(Hero.all.count).to eq(api_heroes.count)
      end

      it "updates existing record in db" do
        api_heroes.first["localized_name"] = "Chuck Norris"
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_heroes).and_return([api_heroes, 200])
        expect {
          SteamWebApi::Dota2::Refresh::refresh_heroes
        }.to change{ Hero.find_by(steam_id: api_heroes.first.id).localized_name }
      end
    end

    context "refreshes item records in db" do
      let(:api_items) { SteamWebApi::Dota2::ApiCall::get_items.first }

      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_items).and_return([api_items, 200])
        SteamWebApi::Dota2::Refresh::refresh_items
      end

      it "creates new records in db" do
        expect(Item.all.count).to eq(api_items.count)
      end

      it "updates existing record in db" do
        api_items.first["name"] = "Millennium Falcon"
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_items).and_return([api_items, 200])
        expect {
          SteamWebApi::Dota2::Refresh::refresh_items
        }.to change{ Item.find_by(steam_id: api_items.first.id).name }
      end
    end
  end

  describe "SteamWebApi::Dota2::Fetch" do

    context "fetches matches" do
      let(:api_match) { SteamWebApi::Dota2::ApiCall::get_matches_by_seq_num.first }
      let(:api_match2) { SteamWebApi::Dota2::ApiCall::get_matches_by_seq_num(api_match.map(&:match_seq_num).max + 1).first }

      before(:each) do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_matches_by_seq_num).and_return([api_match, 1], [[], 500])
        SteamWebApi::Dota2::Fetch.fetch_last_matches
      end

      it "creates new records in empty db" do
        expect(Match.all.count).to eq(api_match.count)
      end

      it "creates new records in db with records" do
        allow(SteamWebApi::Dota2::ApiCall).to receive(:get_matches_by_seq_num).and_return([api_match2, 1], [[], 500])
        SteamWebApi::Dota2::Fetch.fetch_last_matches
        expect(Match.all.count).to eq(api_match.count + api_match2.count)
      end
    end
  end
end
