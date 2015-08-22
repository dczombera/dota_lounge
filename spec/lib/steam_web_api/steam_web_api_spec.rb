require 'rails_helper'

RSpec.describe SteamWebApi::Dota2::Refresh do
  describe "refreshes hero records in db" do
    let(:api_heroes) { SteamWebApi::Dota2::ApiCall::get_heroes.first }

    before(:each) do
      allow(SteamWebApi::Dota2::ApiCall).to receive(:get_heroes).and_return([api_heroes, 200])
      SteamWebApi::Dota2::Refresh::heroes
    end

    it "creates new records in db" do
      expect(Hero.all.count).to eq(api_heroes.count)
    end

    it "updates existing record in db" do
      api_heroes.first["localized_name"] = "Chuck Norris"
      allow(SteamWebApi::Dota2::ApiCall).to receive(:get_heroes).and_return([api_heroes, 200])
      expect {
        SteamWebApi::Dota2::Refresh::heroes
      }.to change{ Hero.find_by(steam_id: api_heroes.first.id).localized_name }
    end
  end
end