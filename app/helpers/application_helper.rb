module ApplicationHelper
  def formattedDateTime(datetime)
    datetime.strftime("%B %d, %Y")
  end

  def capitalize_string(str)
    str.capitalize
  end

  def is_user_profile_complete
    current_user.completed
  end
end
