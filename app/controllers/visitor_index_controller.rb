class VisitorIndexController < ApplicationController
  def index
    
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
    @subcategories = {}
    @top_categories.each do |category|
      @subcategories[category] = Category.find_sub_categories(category)
    end
  end

  def update
  end

  def destroy
  end
end
