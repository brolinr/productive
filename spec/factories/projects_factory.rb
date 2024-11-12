# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    name { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }
    user { create(:user) }
  end
end
