require 'spec_helper'

describe PersonalController do
  before :each do
    @fake_user = double("user")
    ApplicationController.any_instance.stub(:get_temporary_user).and_return(@fake_user)
  end
  describe "index" do
    it "should set params properly if user has logged in" do
      get 'index'
      expect(assigns(:temporary_user)).to equal @fake_user
    end
    it "should set flash properly if user has not logged in" do
      ApplicationController.any_instance.stub(:get_temporary_user).and_return(nil)
      get 'index'
      expect(flash[:notice]).to eq("Not logged in!")
      response.should redirect_to "/"
    end
  end

  describe 'show' do
    it "should set params properly if user has logged in" do
      get 'show', :id => "1"
      expect(assigns(:temporary_user)).to eq(@fake_user)
    end
    it "should set flash properly if user has not logged in" do
      ApplicationController.any_instance.stub(:get_temporary_user).and_return(nil)
      get 'index'
      expect(flash[:notice]).to eq("Not logged in!")
      response.should redirect_to "/"
    end
  end

  describe "edit" do
    it "should set params properly" do
      get 'edit', :id => "1"
      expect(assigns(:temporary_user)).to eq(@fake_user)
    end
  end
end
