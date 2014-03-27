require 'spec_helper'

describe Tag do
  before :each do
    @tag_1 = FactoryGirl.build(:tag, name: "tag_1")
    @tag_2 = FactoryGirl.build(:tag, name: "tag_2")
    @tag_3 = FactoryGirl.build(:tag, name: "tag_3")
    @article_1 = FactoryGirl.build(:article, title: "art_1")
    @article_2 = FactoryGirl.build(:article, title: "art_2")
    @art_list = [@article_1, @article_2]
    @tag_1.stub(:articles).and_return(@art_list)
  end
  describe "get_all_articles" do
    before :each do
      Tag.stub(:find_by_name).with("tag_1").and_return(@tag_1)
      Tag.stub(:find_by_name).with("tag").and_return(nil)
    end
    it "should return all articles if the name is valid" do
      result = Tag.get_all_articles("tag_1")
      expect(result).to eq(@art_list)
    end
    it "should return nil if the name is unvalid" do
      result = Tag.get_all_articles("tag")
      expect(result).to eq(nil)
    end
  end
  describe "Sanitize" do
    before :each do
      Tag.stub(:find_by_name).with("tag_1").and_return(@tag_1)
      Tag.stub(:find_by_name).with("tag_2").and_return(@tag_2)
      Tag.stub(:find_by_name).with("tag_3").and_return(@tag_3)
      Tag.stub(:find_by_name).with("tag").and_return(nil)
    end
    it "should return the sanitized result given an input" do
      result = Tag.sanitize("tag_1,  tag_2,tag_3")
      expect(result).to eq([@tag_1, @tag_2, @tag_3])
    end
    it "should create a new tag if given an unexist tag" do
      fake_new_tag = double("tag")
      Tag.should_receive(:create).with({:name => "tag"}).and_return(fake_new_tag)
      result = Tag.sanitize("tag")
      expect(result).to eq([fake_new_tag])
    end
  end
end
