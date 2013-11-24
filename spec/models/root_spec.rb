require 'spec_helper'

describe Root do
  before :each do
    @admin = FactoryGirl.create(:root, username: "admin", password: "admin")
  end
  
  it "should accept authorized user" do
    result = Root.auth("admin", "admin")
    result.should == true
  end
  
  it "should reject unauthorized user" do
    result = Root.auth("admin", "admi4n")
    result.should == false
  end
  
end
