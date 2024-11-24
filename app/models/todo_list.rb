class TodoList < ApplicationRecord
  belongs_to :project

  has_many :tasks, as: :list, dependent: :destroy
  has_many :task_groups, dependent: :destroy

  validates :title, presence: true

  def fraction_complete_tasks
    "#{tasks.where(complete: true).count}/#{tasks.count} "
  end

  def percentage_complete_tasks
    (tasks.where(complete: true).count.to_f / tasks.count * 100).round(2)
  end
end
