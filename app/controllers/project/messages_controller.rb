class Project::MessagesController < Project::ApplicationController
  def new
    @breadcrumb_links = [
      { text: current_project.name, path: project_path(current_project) },
      { text: "Message board", path: project_message_boards_path }
    ]
  end

  def create
  end
end
