class Chat < ApplicationRecord
  belongs_to :project

  has_many :messages, dependent: :destroy, as: :room
  has_many :chat_members, dependent: :destroy
  has_many :project_users, through: :chat_members

  validate :unique_project_users_pair

  private

  def unique_project_users_pair
    # Fetch the IDs of the two project users associated with this chat
    user_ids = project_users.pluck(:id).sort

    # Check if a chat already exists with the same project and exact user IDs
    if Chat.joins(:chat_members)
           .where(project_id: project_id)
           .where(chat_members: { project_user_id: user_ids })
           .group("chats.id")
           .having("COUNT(chat_members.project_user_id) = ?", user_ids.size)
           .exists?
      errors.add(:project_users, "Chat already exists between these users!")
    end
  end
end
