# frozen_string_literal: true

# This base controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private

  def not_authenticated
    flash[:warning] = 'Чтобы получить доступ к данной странице вы должны авторизоваться'
    redirect_to login_path
  end
end
