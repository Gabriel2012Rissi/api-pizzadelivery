class CustomerDecorator < ApplicationDecorator
  delegate_all

  def full_name
    [object.first_name, object.last_name].join(' ')
  end

  def phone_formatted
    object.phone.gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  end

  def created_at_formatted
    humanize_date_time(object.created_at)
  end
end
