require 'spec_helper'

describe Admin::CategoryController do
  before :each do
    @category_1 = FactoryGirl.create(:category, parent: 0, id: 1, order: 1)
    @category_2 = FactoryGirl.create(:category, parent: 0, id: 2, order: 2)
    @category_3 = FactoryGirl.create(:category, parent: 1, id: 3, order: 3)
    @category_4 = FactoryGirl.create(:category, parent: 2, id: 4, order: 4)
    AdminController.any_instance.stub(:authorize).and_return(true)
    Category.any_instance.stub(:generate_related_priviledges)
  end
  
  describe "Category.find" do
    before :each do
      Admin::CategoryController.any_instance.stub(:validate_edit).and_return(true)
      Admin::CategoryController.any_instance.stub(:validate_delete).and_return(true)
    end
    it "should find the correct category" do
      result = Category.find "1"
      expect(result).to eq(@category_1)
    end
  end
  
  describe "Index Page" do
    before :each do
    Admin::CategoryController.any_instance.stub(:validate_edit).and_return(true)
    Admin::CategoryController.any_instance.stub(:validate_delete).and_return(true)
    end
    it "should goto index page" do
      get 'index'
      response.should render_template('admin/category/index')
    end
  end
  
  describe "delete" do
    before :each do
    Admin::CategoryController.any_instance.stub(:validate_edit).and_return(true)
    Admin::CategoryController.any_instance.stub(:validate_delete).and_return(true)
    end
    it "should be able to destroy" do
      @category_1.should_receive(:destroy)
      Category.should_receive(:find).with("1").and_return(@category_1)
      get 'destroy', {:id => 1}
    end
  end
  
  describe "new sub" do
    before :each do
      Admin::CategoryController.any_instance.stub(:validate_edit).and_return(true)
      Admin::CategoryController.any_instance.stub(:validate_delete).and_return(true)
    end
    it "should be able to add a new subcategory" do
      Category.should_receive(:create!).with(:name => "(new category)", :parent => "1").and_return(@category_1)
      get 'new_sub', {:id => 1}
    end
  end
  
  describe "order" do
    before :each do
    Admin::CategoryController.any_instance.stub(:validate_edit).and_return(true)
    Admin::CategoryController.any_instance.stub(:validate_delete).and_return(true)
    end
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
    before :each do
    Admin::CategoryController.any_instance.stub(:validate_edit).and_return(true)
    Admin::CategoryController.any_instance.stub(:validate_delete).and_return(true)
    end
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
    before :each do
    Admin::CategoryController.any_instance.stub(:validate_edit).and_return(true)
    Admin::CategoryController.any_instance.stub(:validate_delete).and_return(true)
    end
    it "should be able to switch show" do
      Category.should_receive(:find).with("1").and_return(@category_1)
      @category_1.should_receive(:switch_show)
      get 'switch_show', {:id => 1}
    end
  end

  describe "validate_edit" do
    before :each do
      @category = FactoryGirl.build(:category, name: "test", id: 1)
      @all_right_user = FactoryGirl.build(:user, name: "all_right", studentID: "1")
      @no_right_user = FactoryGirl.build(:user, name: "no_user", studentID: "2")
      @priv_edit_all_category = FactoryGirl.build(:priviledge, name: "edit_all_category")
      @priv_edit_single_category = FactoryGirl.build(:priviledge, name: "edit_single_category")
      @all_right_user.stub(:priviledges).and_return([@priv_edit_all_category, @priv_edit_single_category])
      Priviledge.stub(:find_by_name).with("edit_top_category").and_return(@priv_edit_all_category)
      Category.stub(:find).and_return(@category)
      @all_right_user.stub(:has_priviledge?).and_return(true)
      @no_right_user.stub(:has_priviledge?).and_return(false)
    end
    it "should be able to add a top cateogry if the user have priviledge edit_all_category" do
      Admin::CategoryController.any_instance.stub(:get_temporary_user).and_return(@all_right_user)
      get 'new_sub', {:id => "0"}
      response.should redirect_to admin_category_path
    end
    it "should not be able to add a top category if the user does not have priviledge edit_all_category" do
      Admin::CategoryController.any_instance.stub(:get_temporary_user).and_return(@no_right_user)
      get 'new_sub', :id => "0"
      response.should redirect_to admin_index_path
    end
    it 'should be able to edit a category if authorized' do
      Priviledge.stub(:find_by_name).with("edit_category_1").and_return(@priv_edit_single_category)
      Admin::CategoryController.any_instance.stub(:get_temporary_user).and_return(@all_right_user)
      get 'downward', :id => "1"
      response.should redirect_to admin_category_path
    end
    it 'should not be able to edit a category if not authorized' do
      Priviledge.stub(:find_by_name).with("edit_category_1").and_return(@priv_edit_single_category)
      Admin::CategoryController.any_instance.stub(:get_temporary_user).and_return(@no_right_user)
      get 'downward', :id => "1"
      response.should redirect_to admin_index_path
    end
  end

  describe "validate delete" do
    before :each do
      @category = FactoryGirl.build(:category)
      Category.stub(:find).and_return(@category)
      @user_1 = FactoryGirl.build(:user, name: "user_1", studentID: "1")
      @user_2 = FactoryGirl.build(:user, name: "user_2", studentID: "2")
      @priv = FactoryGirl.build(:priviledge, name: "priv")
      Priviledge.stub(:find_by_name).and_return(@priv)
      @user_1.stub(:has_priviledge?).and_return(true)
      @user_2.stub(:has_priviledge?).and_return(false)
    end
    it "should redirect to admin category page if authorized" do
      Admin::CategoryController.any_instance.stub(:get_temporary_user).and_return(@user_1)
      get 'destroy', :id => "1"
      response.should redirect_to admin_category_path
    end
    it "should redirect to admin index page if unauthorized" do
      Admin::CategoryController.any_instance.stub(:get_temporary_user).and_return(@user_2)
      get 'destroy', :id => "1"
      response.should redirect_to admin_index_path
    end
  end

end
