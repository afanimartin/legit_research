module ApplicationHelper
  def formattedDateTime(datetime)
    datetime.strftime("%B %d, %Y")
  end

  def capitalize_string(str)
    str.capitalize
  end
end
