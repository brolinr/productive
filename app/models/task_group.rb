class TaskGroup < ApplicationRecord
  belongs_to :todo_list

  has_many :tasks, as: :group, dependent: :nullify

  validates :title, presence: true
end
