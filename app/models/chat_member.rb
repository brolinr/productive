class ChatMember < ApplicationRecord
  belongs_to :chat
  belongs_to :project_user

  has_many :messages, dependent: :destroy, as: :sender

  validates :project_user_id, uniqueness: { scope: :chat_id }

  def user_name
    project_user.user_name
  end
end
