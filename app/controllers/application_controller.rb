class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by(uname: session[:user_uname])
  end

  def logged_in?
    !!current_user
  end
end
