# frozen_string_literal: true

class FeatureWrapperComponent < ViewComponent::Base
  def initialize(breadcrumb_links: [], heading_text: "", paragraph: "", no_header: false, action_button: {})
    @breadcrumb_links = breadcrumb_links
    @heading_text = heading_text
    @paragraph = paragraph
    @no_header = no_header
    @action_button = action_button
  end
end
