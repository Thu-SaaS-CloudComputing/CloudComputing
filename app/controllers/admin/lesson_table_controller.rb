class Admin::LessonTableController < ApplicationController
  def index
    @classrooms = Lesson.get_all_classrooms
    @departments = Lesson.get_all_departments
    if params.has_key? :classroom
      @lessons = Lesson.find_all_by_classroom params[:classroom]
    elsif params.has_key? :department
      @lessons = Lesson.find_all_by_department params[:department]
    else
      @lessons = Lesson.all
    end
  end

  def edit
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    @lesson.update_attributes!(params[:lesson])
    flash[:notice] = "#{@lesson.name} was successfully updated!"
    redirect_to admin_lesson_table_path
  end

  def new_lesson
    new_les = {:name => "Unknown", :row => 0, :column => 0, :classroom => "Unknown", :department => "Unknown"}
    Lesson.create!(new_les)
    redirect_to admin_lesson_table_path()
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    flash[:notice] = "Lesson '#{lesson.name}' deleted."
    redirect_to admin_lesson_table_path()
  end

end
