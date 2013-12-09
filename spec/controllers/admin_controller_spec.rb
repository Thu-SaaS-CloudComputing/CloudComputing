require 'spec_helper.rb'

describe AdminController do
  describe 'auth' do
    before :each do
      @valid_user_id = "2012012429"
      @invalid_user_id = "2012012428"
      User.stub(:valid?).with(@valid_user_id).and_return(true)
      User.stub(:valid?).with(@invalid_user_id).and_return(false)
    end
    it 'should set the session properly when the login is successful' do
      User.should_receive(:valid?).with(@valid_user_id).and_return(true)
      post :auth, :login => {:username => @valid_user_id}
      session[:user].should be @valid_user_id
      session[:user_timestamp].should_not be nil
    end
    it 'should redirect to the proper page if the login is successful' do
      post :auth, :login => {:username => @valid_user_id}
      response.should redirect_to admin_index_path
    end
    it 'should set the params properly when the login fails' do
      User.should_receive(:valid?).with(@invalid_user_id).and_return(false)
      post :auth, :login => {:username => @invalid_user_id}
      session[:user].should be nil
    end
    it 'should redirect to the proper page if the login fails' do
      post :auth, :login => {:username => @invalid_user_id}
      response.should redirect_to admin_login_path
    end
  end

  describe 'authorize' do
    pending "need further test"
  end
end
