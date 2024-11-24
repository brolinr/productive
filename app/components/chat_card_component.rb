# frozen_string_literal: true

class ChatCardComponent < ViewComponent::Base
  with_collection_parameter :chat
  def initialize(current_project_user: nil, chat: nil)
    @chat = chat

    @sender = @chat.chat_members.where.not(project_user_id: current_project_user.id).last.user_name
    @time = chat.created_at
  end
end
