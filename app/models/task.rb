class Task < ApplicationRecord
  belongs_to :assignee, polymorphic: true, optional: true
  belongs_to :list, polymorphic: true
  belongs_to :group, polymorphic: true, optional: true

  has_many :notifees, as: :notifyable, dependent: :destroy

  has_many :messages, as: :room, dependent: :destroy
  has_rich_text :notes

  validates :title, :due_date, presence: true
end
