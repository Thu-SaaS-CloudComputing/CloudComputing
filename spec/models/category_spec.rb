require 'spec_helper'

describe Category do
  before :each do
    @cat_1 = FactoryGirl.create(:category, name: "cat_1", id: 1, order: 1, show_on_index: 'shown')
    @cat_2 = FactoryGirl.create(:category, name: "cat_2", id: 2, order: 2, show_on_index: 'hidden')
    @cat_3 = FactoryGirl.create(:category, name: "cat_3", id: 3, parent: 1, order: 3)
    @cat_4 = FactoryGirl.create(:category, name: "cat_4", id: 4, parent: 1, order: 4)
    @cat_5 = FactoryGirl.create(:category, name: "cat_5", id: 5, parent: 3, order: 5)
  end

  it "should find topcategories" do
    Category.should_receive(:find_all_by_parent).and_return([@cat_1, @cat_2, @cat_3])
    result = Category.find_top_categories
    result.should == [@cat_1, @cat_2, @cat_3]
  end
  it "should find subcategories" do
    Category.should_receive(:find_all_by_parent).and_return([@cat_3, @cat_4])
    result = Category.find_sub_categories(1)
    result.should == [@cat_3, @cat_4]
  end
  it 'should plant the tree as wished' do
    Category.should_receive(:find_sub_categories).with(1).and_return([@cat_3, @cat_4])
    Category.should_receive(:find_sub_categories).with(3).and_return([@cat_5])
    Category.should_receive(:find_sub_categories).with(5).and_return(nil)
    Category.should_receive(:find_sub_categories).with(4).and_return(nil)
    #@cat_3.should_receive(:tree_plant).and_return('called_3')
    #@cat_4.should_receive(:tree_plant).and_return('called_4')
    @result = @cat_1.tree_plant
    #@result.should == {:cat_1 => ['called_3', 'called_4']}
    @result.should == {:cat_1 => [{:cat_3 => ['cat_5']}, 'cat_4']}
  end
  it 'should give a full category tree' do
    Category.should_receive(:find_top_categories).and_return([@cat_1, @cat_2])
    @cat_1.should_receive(:tree_plant).and_return('cat_1_tree')
    @cat_2.should_receive(:tree_plant).and_return('cat_2_tree')
    result = Category.category_tree
    result.should == ['cat_1_tree', 'cat_2_tree']
  end
  it 'should find top categories specified with shown' do
    Category.stub(:find_all_by_parent).and_return([@cat_1, @cat_2])
    result = Category.find_top_categories_to_show
    result.should == [@cat_1]
  end
end
