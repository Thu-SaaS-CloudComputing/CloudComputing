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
    @top_categories_to_show = Category.find_top_categories_to_show
    @subcategories = {}
    @top_categories_to_show.each do |category|
      @subcategories[category] = Category.find_sub_categories(category)
    end
  end

  def update
  end

  def destroy
  end
end
