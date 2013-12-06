class AdminController < ApplicationController

  before_filter :authorize, :except => [:login, :auth]

  def login
    if params[:logout]
      session[:user] = nil
      session.delete(:user_timestamp)
    end
  end
  
  def auth
    #session[:user] = "2012012427"
    #session[:user_timestamp] = Time.now
    #redirect_to admin_index_path
    if User.valid?(params[:login][:username])
      session[:user] = params[:login][:username]
      session[:user_timestamp] = Time.now
      redirect_to admin_index_path()
    else
      flash[:notice] = "Wrong number"
      session[:user] = nil
      redirect_to admin_login_path()
    end
  end

  def index
  end

private

  def authorize
    if !session[:user] || user_time_out?
      redirect_to admin_login_path
    else
      session[:user_timestamp] = Time.now
    end
  end

  def user_time_out?
    session[:user_timestamp] = Time.now if !session.has_key?(:user_timestamp)
    return session[:user_timestamp] < 15.minutes.ago
  end
  
  #The following are old version of authentification system
  #def login
  #  if params[:logout]
  #    session[:admin_auth] = nil
  #  end
  #end

  #def auth
  #  if Root.auth(params[:login][:username], params[:login][:password])
  #    session[:admin_auth] = Time.now
  #    redirect_to admin_index_path()
  #  else
  #    session[:admin_auth] = nil
  #    redirect_to admin_login_path()
  #  end
  #end

  #def index
  #end

#private

  #def authorize
  #  if !session[:admin_auth] || session[:admin_auth] < 15.minutes.ago
  #    redirect_to admin_login_path()
  #  else
  #    session[:admin_auth] = Time.now
  #  end
  #end
  
end
