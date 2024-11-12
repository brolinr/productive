class Message < ApplicationRecord
  belongs_to :room, polymorphic: true
  belongs_to :sender, polymorphic: true

  has_rich_text :content
  has_many :comments, dependent: :destroy

  validates :content, presence: true
end
