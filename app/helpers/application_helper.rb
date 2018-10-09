module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "MnR Team Check-list"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # Time Formatting
  def format_time(time, timezone)
    time = time.to_time
    content_tag(:span, I18n.l(time, format: :long), data: { timezone: timezone, time: time.iso8601 })
  end

end
