class CategoryController < ApplicationController
  def index
    all_category = Category.all
    @categories = Array.new
    all_category.each do |cat|
      if cat.parent == 0
        @categories << cat
      end
    end
  end
 
  def create
  end
  
  def new
  end

  def edit
  end

  def show
    id = params[:id]
    id ||= 0
    tem_cat = Category.find(id)
    @articles = tem_cat.articles
    @top_category = Category.find_top_categories
    @sub_category = Category.find_sub_categories(tem_cat.id)
  end

  def update
  end

  def destroy
  end
end
