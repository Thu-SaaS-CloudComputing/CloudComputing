class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :refreshState
  
  def refreshState
    if !session[:user] || user_time_out?
      session[:user] = nil
    else
      session[:user_timestamp] = Time.now
    end
  end

  def user_time_out?
    session[:user_timestamp] = Time.now if !session.has_key?(:user_timestamp)
    return session[:user_timestamp] < 15.minutes.ago
  end
end
