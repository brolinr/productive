class ProjectUser < ApplicationRecord
  enum :role, { member: 0, admin: 1 }
  enum :invite_status, { pending: 0, accepted: 1, rejected: 2 }

  belongs_to :user
  belongs_to :project

  has_many :messages, dependent: :destroy, as: :sender
  has_many :chat_messages, through: :chats, source: :messages
  has_many :chat_members, dependent: :destroy
  has_many :chats, through: :chat_members
  has_many :assigned_tasks, as: :assignee, class_name: "Task"
  has_many :notifees, dependent: :destroy
  # has_many :assignees, dependent: :destroy
  # has_many :events, dependent: :destroy
  # has_many :event_participants, dependent: :destroy
  # has_many :todo_lists, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_id, uniqueness: { scope: :project_id, message: " already added" }

  def user_name
    user.name
  end
end
