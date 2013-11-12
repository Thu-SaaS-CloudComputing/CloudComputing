class VisitorIndexController < ApplicationController
  def index
    @articles = Article.all
    @top_categories = Category.find_top_categories
    @subcategories = {}
    @top_categories.each do |category|
      @subcategories[category] = Category.find_sub_categories(category)
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
