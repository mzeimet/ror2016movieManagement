class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :convert_date, :platform_options, :icon_right_wrong

  def convert_date(datetime)
    return datetime.strftime("%d.%m.%Y")
  end

  def platform_options
    return ["Amazon","Flickr","Hulu","Maxdome","Netflix","Stream general","Vimeo","Watchever","Youtube"]
  end

  def icon_true_check
    return "<span class=\"glyphicon glyphicon-ok\" aria-hidden=\"true\"></span>".html_safe
  end

  def icon_false_cross
      return "<span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>".html_safe
  end

  def icon_right_wrong(condition)
    if condition
      return icon_true_check
    else
      return icon_false_cross
    end
  end
end
