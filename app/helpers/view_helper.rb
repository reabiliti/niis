# frozen_string_literal: true

# This base helper for views
module ViewHelper
  def format_date(date)
    date&.strftime('%d.%m.%Y')
  end

  def full_os_address(target)
    "#{target.os_postcode}, #{target.os_address}"
  end

  def full_org_address(target)
    "#{target.org_postcode}, #{target.org_address}"
  end

  def full_applic_address(target)
    "#{target.applic_postcode}, #{target.applic_address}"
  end
end
