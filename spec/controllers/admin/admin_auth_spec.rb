require 'spec_helper'

describe AdminController do
  before :each do
    
  end

  describe "Auth on Index page" do
    it 'should show the index page when logged in' do
      session[:admin_auth] = Time.now;
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
      Root.should_receive(:auth).with("admin", "admin").and_return(true)
      post 'auth', :login => {:username => "admin", :password => "admin"}
      response.should redirect_to admin_index_path()
    end
    
    it 'should check successfully when user is invalid' do
      Root.should_receive(:auth).with("admin", "adm4in").and_return(false)
      post 'auth', :login => {:username => "admin", :password => "adm4in"}
      response.should redirect_to admin_login_path()
    end
  end
  
end

