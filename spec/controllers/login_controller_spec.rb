require 'spec_helper'

describe LoginController do
  describe "index" do
    before :each do
      ApplicationController.any_instance.stub(:refresh_user)
    end
    it "should set user properly when logged in" do
      fake_user = double("user")
      fake_user.stub(:studentID)
      User.should_receive(:set_user).with("1").and_return(fake_user)
      get "index", :username => "1"
    end
    it "should redirect to the index page when not logged out" do
      get "index", :logout => "true"
      response.should redirect_to root_path
    end
  end
end
