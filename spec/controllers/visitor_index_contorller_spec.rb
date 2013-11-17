require 'spec_helper'

describe VisitorIndexController do
  before :each do
    @lesson_1 = FactoryGirl.build(:lesson, name: "fake_1", row: 2, column: 2, classroom: "cla_1", department: "dep_1")
    @lesson_2 = FactoryGirl.build(:lesson, name: "fake_2", row: 3, column: 3, classroom: "cla_2", department: "dep_1")
    @lesson_3 = FactoryGirl.build(:lesson, name: "fake_3", row: 3, column: 3, classroom: "cla_1", department: "dep_2")
    @fake_result = [@lesson_1, @lesson_2, @lesson_3]
    @fake_lassrooms = ["cla_1", "cla_2"]
    @fake_departments = ["dep_1", "dep_2"]
    Lesson.stub(:all).and_return(@fake_result)
    Lesson.stub(:get_all_classrooms).and_return(@fake_classrooms)
    Lesson.stub(:get_all_deaprtments).and_return(@fake_departments)
    Lesson.stub(:find_all_by_classroom).and_return([@lesson_1, @lesson_3])
    Lesson.stub(:find_all_by_department).and_return([@lesson_1, @lesson_2])
  end

  describe 'Lesson table' do
    it 'should access the database' do
      Lesson.should_receive(:all)
      get "show"
    end
    it 'should return a table of lessons' do
      lesson_result = {2 => {2 => [@lesson_1]}, 3 => {3 => [@lesson_2, @lesson_3]}}
      get "show"
      assigns(:table).should == lesson_result
    end
    it 'should return all classrooms' do
      get "show"
      assigns(:classrooms).should == @fake_classrooms
    end
    it 'should return all departments' do
      get "show"
      assigns(:departments).should == @fake_departments
    end
    it 'should be able to sort the result with classroom' do
      get "show", :classroom => "cla_1"
      assigns(:table).should == {2 => {2 => [@lesson_1]}, 3 => {3 => [@lesson_3]}}
    end
    it 'should be able to sort the result with departmetn' do
      get "show", :department => "dep_1"
      assigns(:table).should == {2 => {2 => [@lesson_1]}, 3 => {3 => [@lesson_2]}}
    end


    #it 'should render proper page' do
    #  response.should render_template("visitor_index")
    #  get "index"
    #end
  end
end
