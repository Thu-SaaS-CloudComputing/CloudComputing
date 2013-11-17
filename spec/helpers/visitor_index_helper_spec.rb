require 'spec_helper'

describe VisitorIndexHelper do
  describe 'Lesson table generator' do
    it 'should generate set returned value properly' do
      lesson_1 = FactoryGirl.build(:lesson, name: "fake_1", classroom: "mock", row: 1, column: 1)
      lesson_2 = FactoryGirl.build(:lesson, name: "fake_2", classroom: "mock", row: 1, column: 1)
      result = generate_lesson_table(1, 1, {1 => {1 => [lesson_1, lesson_2]}})
      result.should == [["fake_1", "At mock"], ["fake_2", "At mock"]]
    end
  end
end
