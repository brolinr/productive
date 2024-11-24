FactoryBot.define do
  factory :event do
    title { FFaker::Lorem.sentence }
    date { rand(31).days.from_now }
    time { rand(18).hours.from_now }
    project { create(:project) }
  end
end
