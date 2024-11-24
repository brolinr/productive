# frozen_string_literal: true

class ProjectCardComponent < ViewComponent::Base
  with_collection_parameter :project

  def initialize(project)
    @project = project[:project] || project
  end
end
