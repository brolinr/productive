FactoryBot.define do
  factory :task do
    title { FFaker::Lorem.sentence }
    notes { FFaker::Lorem.paragraph }
    due_date { 5.days.from_now }
    complete { false }
    assignee { create(:project_user) }
    list { create(:todo_list) }
  end
end
