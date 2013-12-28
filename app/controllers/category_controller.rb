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
    @temporary_user = get_temporary_user
    id = params[:id]
    id ||= 0
    @current_category = Category.find(id)
    @articles = @current_category.articles
    @top_category = Category.find_top_categories
    @sub_category = Category.find_sub_categories(@current_category.id)
    
    @trace_category = []
    @i = @current_category
    while @i.parent != 0
      @i = Category.find(@i.parent)
      @trace_category.unshift @i
    end
  end

  def update
  end

  def destroy
  end
end
