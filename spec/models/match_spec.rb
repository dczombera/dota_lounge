require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'Model validation' do
    before { create(:match) }

    it { should validate_presence_of :match_id }
    it { should validate_presence_of :match_seq_num }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :tower_status_radiant }
    it { should validate_presence_of :tower_status_dire }
    it { should validate_presence_of :barracks_status_radiant }
    it { should validate_presence_of :barracks_status_dire }
    it { should validate_presence_of :cluster }
    it { should validate_presence_of :first_blood_time }
    it { should validate_presence_of :lobby_type }
    it { should validate_presence_of :human_players }
    it { should validate_presence_of :leagueid }
    it { should validate_presence_of :positive_votes }
    it { should validate_presence_of :negative_votes }
    it { should validate_presence_of :game_mode }
    it { should validate_presence_of :players }
    it { should_not allow_value(nil).for(:radiant_win) }
    it { should validate_uniqueness_of :match_id }
  end
end