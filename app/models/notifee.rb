class Notifee < ApplicationRecord
  belongs_to :notifyable, polymorphic: true
  belongs_to :project_user

  validates :project_user_id, uniqueness: { scope: :notifyable_id, message: " already added" }
end
