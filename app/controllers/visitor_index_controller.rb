class VisitorIndexController < ApplicationController
  def index
    redirect_to visitor_index_path(0), params
  end
 
  def create
  end
  
  def new
  end

  def edit
  end

  def show
    @articles = Article.all
    @top_categories = Category.find_top_categories
    @top_categories_to_show = Category.find_top_categories_to_show
    @subcategories = {}
    @top_categories_to_show.each do |category|
      @subcategories[category] = Category.find_sub_categories(category)
    end

    @classrooms = Lesson.get_all_classrooms
    @departments = Lesson.get_all_departments
    if params.has_key?(:classroom)
      lessons = Lesson.find_all_by_classroom(params[:classroom])
    elsif params.has_key?(:department)
      lessons = Lesson.find_all_by_department(params[:department])
    else
      lessons = Lesson.all
    end
    @table = Hash.new
    
    lessons.each do |lesson|
      if @table.has_key?(lesson.row)
        rank = @table[lesson.row]
      else
        rank = Hash.new
      end
      if rank.has_key?(lesson.column)
        rank[lesson.column] << lesson
      else
        rank[lesson.column] = [lesson]
      end
      @table[lesson.row] = rank
    end
  end

  def update
  end

  def destroy
  end
end
