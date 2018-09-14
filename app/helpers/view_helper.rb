# frozen_string_literal: true

# This base helper for views
module ViewHelper
  def format_date(date)
    date&.strftime('%d.%m.%Y')
  end
end
