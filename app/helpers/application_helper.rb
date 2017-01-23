module ApplicationHelper
  def parse_date(date)
    return '' if date.blank?
    date.strftime('%d/%m/%Y')
  end
end
