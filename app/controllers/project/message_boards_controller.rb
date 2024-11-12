class Project::MessageBoardsController < Project::ApplicationController
  def index
    @pagy, @messages = pagy(current_project.message_board.messages.includes({ sender: :user }).where(draft: false), limit: 10)
    @breadcrumb_links = [ { text: current_project.name, path: project_path(current_project) } ]
    @action_button = {
      text: "New message",
      icon: "mdi-chat-plus",
      path: new_project_message_path
    }

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @message = current_project.message_board.messages.find(params[:message_id])
    @breadcrumb_links = [
      { text: current_project.name, path: project_path(current_project) },
      { text: "Message board", path: project_message_boards_path }
      ]
  end
end
