require 'spec_helper'

describe User do
  describe 'has_priviledge?' do
    before :each do
      @priv_1 = FactoryGirl.build(:priviledge, name: "priv_1")
      @priv_2 = FactoryGirl.build(:priviledge, name: "priv_2")
      @priv_list = [@priv_1, @priv_2]
      @priv_3 = FactoryGirl.build(:priviledge, name: "priv_3")
      @fake_user = FactoryGirl.build(:user)
      @fake_user.stub(:priviledges).and_return(@priv_list)
      @priv_list.stub(:exists?).with(@priv_1).and_return(true)
      @priv_list.stub(:exists?).with(@priv_2).and_return(true)
      @priv_list.stub(:exists?).with(@priv_3).and_return(false)
    end
    it 'should return true if the user has the priviledge' do
      result = @fake_user.has_priviledge?(@priv_1)
      result.should == true
    end
    it 'should return false if the user does not have the priviledge' do
      result = @fake_user.has_priviledge?(@priv_3)
      result.should == false
    end
  end

  describe 'valid?' do
    before :each do
      @fake_ID = "2012012429"
    end
    it 'should return true when the student number is valid' do
      User.should_receive(:find_by_studentID).with(@fake_ID).and_return(true)
      expect(User.valid?(@fake_ID)).to eq(true)
    end
    it 'should return false when the student number is invalid' do
      User.should_receive(:find_by_studentID).with(@fake_ID).and_return(false)
      expect(User.valid?(@fake_ID)).to eq(false)
    end
  end

  describe 'has_priviledge' do
    before :each do
      @user = FactoryGirl.build(:user)
      @priv_1 = FactoryGirl.build(:priviledge, name: "priv_1")
      @priv_2 = FactoryGirl.build(:priviledge, name: "priv_2")
      @user.stub(:priviledges).and_return([@priv_1])
    end
    it 'should return true if it has the priviledge' do
      expect(@user.has_priviledge?(@priv_1)).to eq true
    end
    it "should return false if it does not have the priviledge" do
      expect(@user.has_priviledge?(@priv_2)).to eq false
    end
  end

  describe "set_user" do
    it "should return expected user if it exists" do
      fake_user = double("user")
      User.stub(:find_by_studentID).and_return(fake_user)
      result = User.set_user("1")
      expect(result).to eq(fake_user)
    end
    it "should create a new user if it does not exist" do
      User.stub(:find_by_studentID).and_return(nil)
      User.should_receive(:create!).with({:studentID => "1", :name => "Unknown user"})
      User.set_user("1")
    end
  end

  #describe 'temporary_user' do
  #  before :each do
  #    @user = FactoryGirl.build(:user, studentID: "2012012429")
  #    @user.stub(:id).and_return(1)
  #    User.stub(:find).and_return(@user)
  #    session[:user] = "2012012429"
  #  end
  #  it 'should return nil if no user in session' do
  #    User.should_receive(:find).with(1).and_return(nil)
  #    result = User.temporary_user
  #    result.should == nil
  #  end
  #  it 'should try find the user if the session is not empty' do
  #    result = User.temporary_user
  #    result.should == @user
  #  end
  #end
end
