FactoryGirl.define do
  factory :item do
    steam_id 1
    name "Lightsaber"
    cost 999
    secret_shop false
    side_shop false
    recipe false
  end
end
