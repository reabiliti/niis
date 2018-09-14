# frozen_string_literal: true

# This sessions controller for authorization users
class SessionsController < ApplicationController
  skip_before_action :require_login, except: :destroy

  def new; end

  def create
    if login(session_params[:email], session_params[:password], session_params[:remember_me])
      redirect_to root_path, flash: { success: 'С возвращением!' }
    else
      flash.now[:danger] = 'Неверная комбинация имени/пароля'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path, flash: { success: 'Увидимся еще!' }
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
