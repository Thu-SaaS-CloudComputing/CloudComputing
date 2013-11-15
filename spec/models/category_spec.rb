require 'spec_helper'

describe Category do
  before :each do
    @cat_1 = FactoryGirl.create(:category, name: "cat_1", id: 1)
    @cat_2 = FactoryGirl.create(:category, name: "cat_2", id: 2)
    @cat_3 = FactoryGirl.create(:category, name: "cat_3", id: 3, parent: 1)
    @cat_4 = FactoryGirl.create(:category, name: "cat_4", id: 4, parent: 1)
    @cat_5 = FactoryGirl.create(:category, name: "cat_5", id: 5, parent: 3)
  end

  it "should find topcategories" do
    Category.should_receive(:find_all_by_parent)
    result = Category.find_top_categories
    result.should == [@cat_1, @cat_2, @cat_3]
  end
  it "should find subcategories" do
    Category.should_receive(:find_all_by_parent)
    result = Category.find_sub_categories(1)
    result.should == [@cat_3, @cat_4]
  end
  it "should give subcategory tree" do

  end
end
