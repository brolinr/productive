# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def display_date(date)
    if date.to_date == Date.today
      "Today"
    elsif date.to_date == Date.yesterday
      "Yesterday"
    elsif date.to_date == Date.tomorrow
      "Tomorrow"
    else
      date.strftime("%a, %-d %b %Y") # e.g., Friday, 1 Nov 2024
    end
  end


  def current_project
    @current_project
  end
end
