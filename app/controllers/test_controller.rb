class TestController < ApplicationController
  def ckeditor
    @categories = Category.all
    @article = Article.find(1)
  end
end
