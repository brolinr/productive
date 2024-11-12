# frozen_string_literal: true

class MessageCardComponent < ViewComponent::Base
  with_collection_parameter :message

  def initialize(message: nil)
    @message = message
  end
end
