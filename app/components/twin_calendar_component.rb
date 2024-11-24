# frozen_string_literal: true

class TwinCalendarComponent < ViewComponent::Base
  def initialize(year: nil, month: nil, control: nil, selected_date: nil)
    @control = control
    @year = year&.to_i || Date.today.year
    @month = month&.to_i || Date.today.month
    @year, @month = adjust_year_and_month(@year, @month)
    @selected_date = selected_date.is_a?(String) ? Date.parse(selected_date) : Date.today

    # Generate calendars for two months
    @first_month_weeks = generate_calendar(year: @year, month: @month)
    second_month_year, second_month = adjust_year_and_month(@year, @month + 1)
    @second_month_weeks = generate_calendar(year: second_month_year, month: second_month)

    @second_month = second_month
    @second_month_year = second_month_year
  end

  private

  def adjust_year_and_month(year, month)
    while month < 1
      year -= 1
      month += 12
    end
    while month > 12
      year += 1
      month -= 12
    end
    [ year, month ]
  end

  def generate_calendar(year:, month:)
    first_day = Date.new(year, month, 1)
    last_day = Date.new(year, month, -1)

    start_date = first_day - first_day.wday
    end_date = last_day + (6 - last_day.wday)

    (start_date..end_date).to_a.each_slice(7).map do |week|
      week.map { |day| { date: day, events: events_on(day) } }
    end
  end

  def events_on(date)
    Event.where(date: date) # Update according to your event model's schema
  end
end
