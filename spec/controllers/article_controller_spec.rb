require 'spec_helper'

describe ArticlesController do

  before :each do
    @result_1 = FactoryGirl.build(:category, name: "One", id: 1)
    @result_2 = FactoryGirl.build(:category, name: "Two", id: 2)
    @result_3 = FactoryGirl.build(:category, name: "Three", id: 3, parent: 1)
    
    @sub_category = [@result_3]
    @top_category = [@result_1, @result_2]

    Category.stub(:find).and_return(@result_1)
    Category.stub(:find_top_categories).and_return(@top_category)
    Category.stub(:find_sub_categories).and_return(@sub_category)
    
    @article_1 = FactoryGirl.build(:article, title: "One", id: 1, category: @result_1)
    @article_2 = FactoryGirl.build(:article, title: "Two", id: 2, category: @result_2)
    
    Article.stub(:find).and_return(@article_1)
  end

  describe "show the articles" do
    it "returns http success" do
      get 'show', :id => 0
      response.should be_success
    end
    it "show the right article" do
      Article.should_receive(:find).with("1")
      get 'show', :id => 1
    end
  end

end
