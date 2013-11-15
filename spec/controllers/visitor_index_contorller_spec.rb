require 'spec_helper'

describe VisitorIndexController do
  before :each do
    @lesson_1 = FactoryGirl.build(:lesson, name: "fake_1", row: 2, column: 2)
    @lesson_2 = FactoryGirl.build(:lesson, name: "fake_2", row: 3, column: 3)
    @lesson_3 = FactoryGirl.build(:lesson, name: "fake_3", row: 3, column: 3)
    @fake_result = [@lesson_1, @lesson_2, @lesson_3]
    Lesson.stub(:all).and_return(@fake_result)
  end
  describe 'Lesson table' do
    it 'should access the database' do
      Lesson.should_receive(:all)
      get "index"
    end
    it 'should return a table of lessons' do
      lesson_result = {2 => {2 => [@lesson_1]}, 3 => {3 => [@lesson_2, @lesson_3]}}
      get "index"
      assigns(:table).should == lesson_result
    end
    #it 'should render proper page' do
    #  response.should render_template("visitor_index")
    #  get "index"
    #end
  end
end
