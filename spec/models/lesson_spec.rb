require 'spec_helper'

describe Lesson do
  before :each do
    FactoryGirl.create(:lesson, department: "dep_1", classroom: "cla_1")
    FactoryGirl.create(:lesson, department: "dep_2", classroom: "cla_2")
    FactoryGirl.create(:lesson, department: "dep_3", classroom: "cla_3")
    FactoryGirl.create(:lesson, department: "dep_1", classroom: "cla_2")
    FactoryGirl.create(:lesson, department: "dep_2", classroom: "cla_1")
    FactoryGirl.create(:lesson, department: "dep_3", classroom: "cla_3")
  end
  it 'should be able to return all departments' do
    result = Lesson.get_all_departments
    result.should == ["dep_1", "dep_2", "dep_3"]
  end
  it 'should be able to return all classrooms' do
    result = Lesson.get_all_classrooms
    result.should == ["cla_1", "cla_2", "cla_3"]
  end
end
