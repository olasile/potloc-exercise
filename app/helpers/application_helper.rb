module ApplicationHelper
  def flash_alert_class(type)
    case type
    when 'success'
      'success'
    when 'error'
      'danger'
    else
      'info'
    end
  end
end
