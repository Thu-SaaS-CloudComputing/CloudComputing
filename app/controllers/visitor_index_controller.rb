class VisitorIndexController < ApplicationController
  def index
    @articles = Article.all
    @top_categories = Category.find_top_categories
    @subcategories = {}
    @top_categories.each do |category|
      @subcategories[category] = Category.find_sub_categories(category)
    end
    
    lessons = Lesson.all
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
 
  def create
  end
  
  def new
  end

  def edit
  end

  def show
    
  end

  def update
  end

  def destroy
  end
end
