FactoryBot.define do
  factory :comment do
    content { "MyText" }
    message { nil }
    project_user { nil }
  end
end
