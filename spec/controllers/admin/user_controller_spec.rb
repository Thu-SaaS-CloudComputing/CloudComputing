require 'spec_helper'

describe Admin::UserController do
  describe 'index action' do
    before :each do
      @result = [mock("fake_1"), mock("fake_2")]
      User.stub(:all).and_return(@result)
    end
    it 'should try to get all users' do
      User.should_receive(:all)
      get :index
    end
    it 'should set the return value properly' do
      get :index
      assigns(:users).should == @result
    end
  end

  describe 'show action' do
    before :each do
      @fake_result = [mock("priv_1"), mock("priv_2")]
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
      assigns(:user).should == @user_1
      assigns(:priviledges).should == @fake_result
      assigns(:all_priviledges).should == @fake_result
    end
  end
end
