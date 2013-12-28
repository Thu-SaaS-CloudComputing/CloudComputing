class ApplicationController < ActionController::Base
  before_filter :refresh_timestamp
  protect_from_forgery
  def get_temporary_user
    if session[:user]
      session[:user_timestamp] = Time.now
      return User.find_by_studentID(session[:user])
    end
  end

  def refresh_timestamp
    session[:user_timestamp] = Time.now if session.has_key?(:user_timestamp)
  end
end
