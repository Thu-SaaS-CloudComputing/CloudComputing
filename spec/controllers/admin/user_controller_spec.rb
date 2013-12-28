require 'spec_helper'

describe Admin::UserController do
  before :each do
    AdminController.any_instance.stub(:authorize).and_return(true)
  end
  describe 'index action' do
    before :each do
      Admin::UserController.any_instance.stub(:validate).and_return(true)
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
      Admin::UserController.any_instance.stub(:validate).and_return(true)
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
    before :each do
      @user_1 = FactoryGirl.build(:user, name: "user_1", studentID: "1")
      @user_2 = FactoryGirl.build(:user, name: "user_2", studentID: "2")
      @priv = FactoryGirl.build(:priviledge)
      Priviledge.stub(:find_by_name).and_return(@priv)
      @user_1.stub(:has_priviledge?).and_return(true)
      @user_2.stub(:has_priviledge?).and_return(false)
    end
    it 'should be seen if authorized' do
      Admin::UserController.any_instance.stub(:get_temporary_user).and_return(@user_1)
      get 'index'
      response.should render_template('index')
    end
    it 'should not be seen if unauthorized' do
      Admin::UserController.any_instance.stub(:get_temporary_user).and_return(@user_2)
      get 'index'
      response.should redirect_to admin_index_path
    end
  end

  describe "switch" do
    before :each do
      Admin::UserController.any_instance.stub(:validate).and_return(true)
      @user = FactoryGirl.build(:user)
      User.stub(:find).and_return(@user)
      @priv_1 = FactoryGirl.build(:priviledge, name: "priv_1")
      @priv_2 = FactoryGirl.build(:priviledge, name: "priv_2")
      @user.priviledges << @priv_1
      @user.stub(:id).and_return(1)
      #@user.stub(:has_priviledge?).with(@priv_1).and_return(true)
      #@user.stub(:has_priviledge?).with(@priv_2).and_return(false)
      #Priviledge.stub(:find).and_return(@priv_1)
      #Priviledge.stub(:find).with(2).and_return(@priv_2)
    end
    it "should delete priv_1 from user's priviledge list if it already has" do
      Priviledge.stub(:find).and_return(@priv_1)
      @user.stub(:has_priviledge).and_return(true)
      put "switch", :id => 1, :priviledge => 1
      expect(@user.priviledges).to eq([])
    end
    it "should add the priviledge into the priviledge list if it does not have" do
      Priviledge.stub(:find).and_return(@priv_2)
      @user.stub(:has_priviledge).and_return(false)
      put 'switch', :id => 1, :priviledge => 1
      expect(@user.priviledges).to eq([@priv_1, @priv_2])
    end
  end
end
