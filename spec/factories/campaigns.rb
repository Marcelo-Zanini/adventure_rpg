FactoryBot.define do
  factory :campaign do
    sequence :name do
      "Campanha #{n}"
    end
    description { "MyText" }
    player
    end
end
