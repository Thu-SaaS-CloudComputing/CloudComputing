require 'spec_helper'

describe Category do
  before :each do
    FactoryGirl.create(:category, name: "cat_1", id: 1)
    FactoryGirl.create(:category, name: "cat_2", id: 2)
    FactoryGirl.create(:category, name: "cat_3", id: 3, parent: 1)
    FactoryGirl.create(:category, name: "cat_4", id: 4, parent: 1)
    FactoryGirl.create(:category, name: "cat_5", id: 5, parent: 3)
  end

  it "should find topcategories" do
    Category.should_receive(:find_all_by_parent)#.with(0)
    Category.find_top_categories

  end
  it "should find subcategories" do
    Category.should_receive(:find_all_by_parent)#.with(1)
    Category.find_sub_categories(1)
  end
  it "should give subcategory tree" do

  end
end
