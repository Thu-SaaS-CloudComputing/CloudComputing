class Admin::LessonTableController < AdminController
  def index
    @lessons = Hash.new

    if params[:sort] == "classroom"
      @table_head = Lesson.get_all_classrooms
      @table_head.each do |classroom|
        @lessons[classroom.to_sym] = Lesson.find_all_by_classroom(classroom)
      end
    elsif params[:sort] == "department"
      @table_head = Lesson.get_all_departments
      @table_head.each do |department|
        @lessons[department.to_sym] = Lesson.find_all_by_department(department)
      end
    else
      @table_head = ["All Lessons"]
      @lessons["All Lessons"] = Lesson.all
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
