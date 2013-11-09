class Admin::CategoryController < ApplicationController
  def index
    @categories = []
    Category.find_top_categories.each do
      |t|
      @categories << {:prefix => " -", :content => t}
      t.push_sub_categories(@categories, 1)
    end
  end
 
  def create
  end
  
  def new
  end

  def edit
  end

  def show
    @categories = []
    Category.find_top_categories.each do
      |t|
      @categories << {:prefix => "- ", :content => t}
      t.push_sub_categories(@categories, 1)
    end
  end

  def update
  end

  def destroy
  end
end
