class LoginController < ApplicationController

  def index
    if (params[:logout] == "true")
      session[:user] = nil;
      redirect_to root_path
      return
    end
    session[:user] = params[:username];
  end
  
end
