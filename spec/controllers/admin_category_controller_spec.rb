require 'spec_helper'

describe Admin::CategoryController do

  describe "GET 'index'" do
    it "should goto index page" do
      get :show, {:id => 0}
    end
  end
  
  #describe "delete" do
  #  it "should be able to delete" do
  #    get :destroy, {:id => 1}
  #  end
  #end
  
  describe "new sub" do
    it "should be able to add new sub" do
      get :new_sub, {:id => 1}
    end
  end
  
  #describe "up" do
  #  it "should be able to upward" do
  #    get :upward, {:id => 1}
  #  end
  #end
  
  #describe "down" do
  #  it "should be able to downward" do
  #    get :downward, {:id => 1}
  #  end
  #end

end
