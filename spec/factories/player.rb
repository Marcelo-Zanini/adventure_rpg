FactoryBot.define do
  factory :player do
    sequence :email do |n|
      "player#{n}@generic.com"
    end
    sequence :name do |n|
      "Player #{n}"
    end
    password  { "F4k3p455w0rd" }
    master { false }
  end
  factory :master, class: Player do
    sequence :email do |n|
      "master#{n}@generic.com"
    end
    sequence :name do |n|
      "Master #{n}"
    end
    password  { "F4k3p455w0rd" }
    master { true }
  end
end
