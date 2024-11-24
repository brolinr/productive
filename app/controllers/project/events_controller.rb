class Project::EventsController < Project::ApplicationController
  def index
    @breadcrumb_links = [
      { text: current_project.name, path: project_path(current_project) }
    ]

    @day_events = current_project.events.where(date: params[:selected_date].nil? ? Date.today : Date.parse(params[:selected_date]))
    @this_week_events_pagy, @this_week_events = pagy(Event.where(date: Date.today..Date.today + 6).order(:date, :time), limit: 5)
  end
end
