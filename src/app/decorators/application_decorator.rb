class ApplicationDecorator < Draper::Decorator
  delegate_all

  def humanize_date(date)
    date.strftime('%d/%m/%Y')
  end

  def humanize_date_time(date_time)
    date_time.strftime('%d/%m/%Y %H:%M')
  end

  def humanize_time(time)
    time.strftime('%H:%M')
  end
  
  def humanize_money(amount, unit='R$')
    amount.to_s(:currency, unit: unit, separator: ',', delimiter: '.')
  end
end
