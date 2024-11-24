class Project::ChatsController < Project::ApplicationController
  def index
    @pagy, @chats = pagy(current_project_user.chats.includes(:messages), limit: 10)
    @breadcrumb_links = [ { text: current_project.name, path: project_path(current_project) } ]
  end

  def show
    @chat = Chat.includes(:project_users, :messages).find_by(id: params[:id])
    @messages = @chat.messages.order(:created_at).group_by { |chat| chat.created_at.to_date }
    @other_member = @chat.project_users.map(&:user_name)
    @other_member.delete(current_project_user.user_name)
    @breadcrumb_links = [
      { text: current_project.name, path: project_path(current_project) },
      { text: "Chats", path: project_chats_path }
    ]
  end
end
