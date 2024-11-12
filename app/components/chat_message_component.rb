# frozen_string_literal: true

class ChatMessageComponent < ViewComponent::Base
  with_collection_parameter :object
  def initialize(object: nil, sender: "", time: "", message: "")
    @sender = sender
    @time = time
    @message = message
    @object = object
  end
end
