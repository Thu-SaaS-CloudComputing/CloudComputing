require 'spec_helper'

describe Admin::LessonTableController do
  before :each do
    @lesson_1 = FactoryGirl.build(:lesson, name: "fake_1", row: 1, column: 1, classroom: "cla_1", department: "dep_1")
    @lesson_2 = FactoryGirl.build(:lesson, name: "fake_2", row: 2, column: 2, classroom: "cla_2", department: "dep_2")
    @lesson_3 = FactoryGirl.build(:lesson, name: "fake_3", row: 3, column: 3, classroom: "cla_1", department: "dep_2")
    @lesson_4 = FactoryGirl.build(:lesson, name: "fake_4", row: 4, column: 4, classroom: "cla_1", department: "dep_1")
    Lesson.stub(:get_all_classrooms).and_return(["cla_1", "cla_2"])
    Lesson.stub(:get_all_departments).and_return(["dep_1", "dep_2"])
    Lesson.stub(:find_all_by_department).with("dep_1").and_return([@lesson_1, @lesson_4])
    Lesson.stub(:find_all_by_department).with("dep_2").and_return([@lesson_2, @lesson_3])
    Lesson.stub(:find_all_by_classroom).with("cla_1").and_return([@lesson_1, @lesson_3, @lesson_4])
    Lesson.stub(:find_all_by_classroom).with("cla_2").and_return([@lesson_2])
    Lesson.stub(:all).and_return([@lesson_1, @lesson_2, @lesson_3, @lesson_4])
    session[:admin_auth] = Time.now;
  end

  describe "Index page" do
    it 'should have lessons list properly when not specified' do
      Lesson.should_receive(:all)
      get 'index'
      assigns(:table_head).should == ["All Lessons"]
      assigns(:lessons).should == {"All Lessons" => [@lesson_1, @lesson_2, @lesson_3, @lesson_4]}
    end
    it 'should have lessons list properly when specified with classroom' do
      Lesson.should_receive(:get_all_classrooms)
      get 'index', :sort => "classroom"
      assigns(:table_head).should == ["cla_1", "cla_2"]
      assigns(:lessons).should == {"cla_1" => [@lesson_1, @lesson_3, @lesson_4], "cla_2" => [@lesson_2]}
    end
    it 'should have lessons listed properly when specified with department' do
      Lesson.should_receive(:get_all_departments)
      get 'index', :sort => "department"
      assigns(:table_head).should == ["dep_1", "dep_2"]
      assigns(:lessons).should == {"dep_1" => [@lesson_1, @lesson_4], "dep_2" => [@lesson_2, @lesson_3]}
    end
  end

  describe 'Edit page' do
    it 'should list info of the lesson' do
      Lesson.should_receive(:find).with("1").and_return(@lesson_1)
      get 'edit', :id => 1
      assigns(:lesson).should == @lesson_1
    end
  end

  describe 'Update page' do
    it 'should call functions properly' do
      Lesson.should_receive(:find).with("1").and_return(@lesson_1)
      @lesson_1.should_receive(:update_attributes!)
      get 'update', :id => 1
    end
    it 'should properly set the notice' do
      Lesson.stub(:find).and_return(@lesson_1)
      @lesson_1.stub(:update_attributes!)
      get 'update', :id => 1
      flash[:notice].should == "fake_1 was successfully updated!"
    end
    it 'should redirect to admin page' do
      Lesson.stub(:find).and_return(@lesson_1)
      @lesson_1.stub(:update_attributes!)
      get 'update', :id => 1
      response.should redirect_to admin_lesson_table_path()
    end
  end

  describe 'new_lesson method' do
    it 'should create a new lesson' do
      Lesson.should_receive(:create!)
      get 'new_lesson', :id => 0
    end
    it 'should redirect to admin page' do
      get 'new_lesson', :id => 0
      response.should redirect_to admin_lesson_table_path()
    end
  end

  describe 'destroy method' do
    it 'should call proper method' do
      Lesson.should_receive(:find).with("1").and_return(@lesson_1)
      @lesson_1.should_receive(:destroy)
      get 'destroy', :id => 1
    end
    it 'should set notice properly' do
      Lesson.stub(:find).and_return(@lesson_1)
      @lesson_1.stub(:destroy)
      get 'destroy', :id => 1
      flash[:notice].should == "Lesson 'fake_1' deleted."
    end
  end
end
