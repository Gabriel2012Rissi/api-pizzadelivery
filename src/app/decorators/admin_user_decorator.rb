class AdminUserDecorator < ApplicationDecorator
  delegate_all

  def created_at_formatted
    humanize_date_time(object.created_at)
  end

  def updated_at_formatted
    humanize_date_time(object.updated_at)
  end
end