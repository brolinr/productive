class Project::TodoListsController < Project::ApplicationController
  def new
    @breadcrumb_links = [
      { text: current_project.name, path: project_path(current_project) },
      { text: "Todo lists", path: project_todo_lists_path }
    ]
  end

  def index
    @pagy, @todo_lists = pagy(current_project.todo_lists.includes(:tasks, :task_groups), limit: 12)
    @breadcrumb_links = [ { text: current_project.name, path: project_path(current_project) } ]
    @action_button = {
      text: "New todo list",
      icon: "mdi-chat-plus",
      path: new_project_todo_list_path
    }

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @todo_list = current_project.todo_lists.includes(:task_groups, :tasks).find(params[:id])
    @tasks = @todo_list.tasks.group_by { |task| task.group }
    @breadcrumb_links = [
      { text: current_project.name, path: project_path(current_project) },
      { text: "Todo lists", path: project_todo_lists_path }
    ]
  end

  def edit
    @breadcrumb_links = [
      { text: current_project.name, path: project_path(current_project) },
      { text: "Todo lists", path: project_todo_lists_path }
    ]
  end
end
