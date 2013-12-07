require 'spec_helper'

describe AdminController do

  describe "Auth on Index page" do
    it 'should show the index page when logged in' do
      session[:user_timestamp] = Time.now;
      session[:user] = "2012012429"
      get 'index'
      response.should_not redirect_to admin_login_path()
    end
    
    it 'should show the login page when not logged in' do
      get 'index'
      response.should redirect_to admin_login_path()
    end
  end

  describe "Auth when login" do
    it 'should check successfully when user is valid' do
      User.should_receive(:valid?).with("2012012429").and_return(true)
      post 'auth', :login => {:username => "2012012429", :password => "admin"}
      response.should redirect_to admin_index_path()
    end
    
    it 'should check successfully when user is invalid' do
      User.should_receive(:valid?).with("2012012429").and_return(false)
      post 'auth', :login => {:username => "2012012429", :password => "adm4in"}
      response.should redirect_to admin_login_path()
    end
  end
  
end

