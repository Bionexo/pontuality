class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate!

  private

  def authenticate!
    redirect_to(sign_in_path) unless session[:user]
  end
end
