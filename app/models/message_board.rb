class MessageBoard < ApplicationRecord
  belongs_to :project

  has_many :messages, dependent: :destroy, as: :room
end
