class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    helper_method :convert_date, :platform_options, :icon_right_wrong, :icon_view, :icon_edit, :icon_delete, :icon_add, :icon_true_check

    def convert_date(datetime)
        datetime.strftime('%d.%m.%Y')
    end

    def platform_options
        ['Amazon', 'Flickr', 'Hulu', 'Maxdome', 'Netflix', 'Stream general', 'Vimeo', 'Watchever', 'Youtube']
    end

    def icon_true_check
        '<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>'.html_safe
    end

    def icon_false_cross
        '<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>'.html_safe
    end

    def icon_right_wrong(condition)
        if condition
            return icon_true_check
        else
            return icon_false_cross
        end
    end

    def icon_view
        '<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>'.html_safe
    end

    def icon_edit
        '<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>'.html_safe
    end

    def icon_delete
        '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>'.html_safe
    end

    def icon_add
      '<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>'.html_safe
    end
end
