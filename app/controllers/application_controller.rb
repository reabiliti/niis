# frozen_string_literal: true

# This base controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, flash: { warning: t('sessions.notices.warning.not_authenticated') }
  end

  def check_auth
    return unless current_user

    redirect_to root_path, flash: { warning: t('sessions.notices.warning.check_auth') }
  end
end
