require 'spec_helper'

describe Admin::UserController do
  before :each do
    AdminController.any_instance.stub(:authorize).and_return(true)
    Admin::UserController.any_instance.stub(:validate).and_return(true)
  end
  describe 'index action' do
    before :each do
      @result = [double("fake_1"), double("fake_2")]
      User.stub(:all).and_return(@result)
    end
    it 'should try to get all users' do
      User.should_receive(:all)
      get :index
    end
    it 'should set the return value properly' do
      get :index
      expect(assigns(:users)).to eq(@result)
    end
  end

  describe 'show action' do
    before :each do
      @fake_result = [double("priv_1"), double("priv_2")]
      @user_1 = FactoryGirl.build(:user, name: "user_1", studentID: 2012012429)
      User.stub(:find).and_return(@user_1)
      @user_1.stub(:priviledges).and_return(@fake_result)
      Priviledge.stub(:all).and_return(@fake_result)
    end
    it 'should find the user specified' do
      User.should_receive(:find).with("1")
      get :show, :id => "1"
    end
    it 'should find priviledges for that specific user' do
      @user_1.should_receive(:priviledges)
      get :show, :id => "1"
    end
    it 'should find all priviledges' do
      Priviledge.should_receive(:all)
      get :show, :id => "1"
    end
    it 'should set the return value properly' do
      get :show, :id => "1"
      assigns(:user).should be @user_1
      expect(assigns(:priviledges)).to eq(@fake_result)
      expect(assigns(:all_priviledges)).to eq(@fake_result)
    end
  end

  describe 'validate' do
    pending "Needs further test"
  end
end
