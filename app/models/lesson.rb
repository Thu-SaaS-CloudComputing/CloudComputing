class Lesson < ActiveRecord::Base

  attr_accessible :name, :column, :row, :classroom, :department
  def self.get_all_classrooms
    lessons = Lesson.all
    result = Array.new
    lessons.each do |lesson|
      result << lesson.classroom
    end
    return result.uniq
  end

  def self.get_all_departments
    lessons = Lesson.all
    result = Array.new
    lessons.each do |lesson|
      result << lesson.department
    end
    return result.uniq
  end
end
