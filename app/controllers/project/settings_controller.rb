class Project::SettingsController < Project::ApplicationController
  def index
    @breadcrumb_links = [ { text: current_project.name, path: project_path(current_project) } ]
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
