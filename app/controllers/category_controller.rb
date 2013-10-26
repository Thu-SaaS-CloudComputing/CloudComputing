class CategoryController < ApplicationController
  def index
    all_category = Category.all
  end
end
