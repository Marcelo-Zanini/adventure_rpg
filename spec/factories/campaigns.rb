FactoryBot.define do
  factory :campaign do
    sequence :name do |n|
      "Campanha #{n}"
    end
    description { "MyText" }
    players_number { 3 }
    player
    end
end
