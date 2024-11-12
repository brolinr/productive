# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user

  has_many :project_users, dependent: :destroy
  has_one :message_board, dependent: :destroy

  validates :name, :description, presence: true
end
