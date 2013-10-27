class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end
 
  def create
  end
  
  def new
  end

  def edit
  end

  def show
    @categories= Category.all
    id = params[:id]
    id |= 0
    @articles = Category.find_by_id(id).articles
  end

  def update
  end

  def destroy
  end

end
