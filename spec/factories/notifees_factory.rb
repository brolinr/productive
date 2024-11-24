FactoryBot.define do
  factory :notifee do
    notifyable { create(:event) }
    project_user { create(:project_user) }
  end
end
