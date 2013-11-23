class AdminController < ApplicationController
  
  before_filter :authorize, :except => [:login, :auth]
  
  def login
    if params[:logout]
      session[:admin_auth] = nil;
    end
  end
  
  def auth
    print params
    if Root.auth(params[:login][:username], params[:login][:password])
      session[:admin_auth] = true;
    else
      session[:admin_auth] = nil;
    end
    redirect_to admin_index_path()
  end
  
  def index
  end
  
private
  
  def authorize
    if !session[:admin_auth]
      redirect_to admin_login_path()
    end
  end
  
end
