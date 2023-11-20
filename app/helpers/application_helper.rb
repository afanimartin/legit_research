module ApplicationHelper
  def formattedDateTime(datetime)
    datetime.strftime("%B %d, %Y")
  end
end
