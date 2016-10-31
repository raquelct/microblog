module ApplicationHelper
  ALERT_TYPES = [:danger, :info, :success, :warning] unless const_defined?(:ALERT_TYPES)

  def fa(icon)
    glyphicon = "fa-#{icon.to_s}"
    "<i class='fa #{glyphicon}'></i>".html_safe
  end

  def display_flash_messages
    render "/layouts/messages"
  end

  def display_date(date, format = :default)
    date ? l(date, format: format) : ""
  end

  def login_label(user)
    name_parts = user.name.split(" ")
    label = name_parts.first
    label += " #{name_parts.last}" if name_parts.length > 1
    label
  end

  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"
    when "error"
      "alert-danger"
    when "alert"
      "alert-warning"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end
end
