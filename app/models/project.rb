# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user

  has_many :project_users, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :events, dependent: :destroy

  has_many :task_groups, through: :todo_lists

  has_one :message_board, dependent: :destroy

  validates :name, :description, presence: true
end
