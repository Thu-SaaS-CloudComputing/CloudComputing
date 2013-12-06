require 'spec_helper'

describe Admin::CategoryController do
  before :each do
    @category_1 = FactoryGirl.create(:category, parent: 0, id: 1, order: 1)
    @category_2 = FactoryGirl.create(:category, parent: 0, id: 2, order: 2)
    @category_3 = FactoryGirl.create(:category, parent: 1, id: 3, order: 3)
    @category_4 = FactoryGirl.create(:category, parent: 2, id: 4, order: 4)
    session[:user_timestamp] = Time.now;
    session[:user] = "2012012429"
    Admin::CategoryController.any_instance.stub(:validate_edit).and_return(true)
    Admin::CategoryController.any_instance.stub(:validate_delete).and_return(true)
  end
  
  describe "Category.find" do
    it "should find the correct category" do
      result = Category.find "1"
      result.should == @category_1
    end
  end
  
  describe "Index Page" do
    it "should goto index page" do
      get 'index'
      response.should render_template('admin/category/index')
    end
  end
  
  describe "delete" do
    it "should be able to destroy" do
      @category_1.should_receive(:destroy)
      Category.should_receive(:find).with("1").and_return(@category_1)
      get 'destroy', {:id => 1}
    end
  end
  
  describe "new sub" do
    it "should be able to add new sub" do
      Category.should_receive(:create!).with(:name => "(new category)", :parent => "1")
      get 'new_sub', {:id => 1}
    end
  end
  
  describe "order" do
    it "should be able to go upward" do
      Category.should_receive(:find).with("2").and_return(@category_2)
      Category.should_receive(:find_sub_categories).with(0).and_return([@category_1, @category_2])
      @category_2.should_receive(:order=).with(1)
      @category_1.should_receive(:order=).with(2)
      get 'upward', {:id => 2}
    end
    it "should be able to go downward" do
      Category.should_receive(:find).with("1").and_return(@category_1)
      Category.should_receive(:find_sub_categories).with(0).and_return([@category_1, @category_2])
      @category_2.should_receive(:order=).with(1)
      @category_1.should_receive(:order=).with(2)
      get 'downward', {:id => 1}
    end
  end
  
  describe "edit and update" do
    it "should be able to show info when editing" do
      Category.should_receive(:find).with("1").and_return(@category_1)
      get 'edit', {:id => 1}
    end
    it "should be able to update info" do
      Category.should_receive(:find).with("1").and_return(@category_1)
      @category_1.should_receive(:update_attributes!).with({"name" => "new_name"})
      get 'update', {:id => 1, :category => {:name => "new_name"}}
      response.should redirect_to admin_category_path
    end
  end
  
  describe "switch show" do
    it "should be able to switch show" do
      Category.should_receive(:find).with("1").and_return(@category_1)
      @category_1.should_receive(:switch_show)
      get 'switch_show', {:id => 1}
    end
  end

end
