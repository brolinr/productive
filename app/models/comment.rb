class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :project_user

  def sender
    project_user.user.name
  end
end
