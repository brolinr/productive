FactoryBot.define do
  factory :todo_list do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    project { create(:project) }
  end
end
