FactoryGirl.define do
  factory :ability do
    steam_id 5508
    name "troll_warlord_berserkers_rage"
    localized_name "Berserker's Rage"
    association :hero
  end

end
