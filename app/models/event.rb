class Event < ApplicationRecord
  validates :title, :date, :time, presence: true

  belongs_to :project

  has_many :notifees, as: :notifyable, dependent: :destroy
  has_many :project_users, through: :notifees
end
