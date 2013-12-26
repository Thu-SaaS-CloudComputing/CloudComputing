class LoginController < ApplicationController

  def index
    if (params[:logout] == "true")
      session[:user] = nil;
      redirect_to root_path
      return
    end
    user = User.set_user(params[:username])
    refresh_user(user.studentID)
  end

  def refresh_user(studentID)
    session[:user] = studentID
    session[:user_timestamp] = Time.now
  end
end
