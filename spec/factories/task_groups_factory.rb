FactoryBot.define do
  factory :task_group do
    title { FFaker::Lorem.word }
    card_color { "#FFFFF" }
    todo_list { create(:todo_list) }
  end
end
