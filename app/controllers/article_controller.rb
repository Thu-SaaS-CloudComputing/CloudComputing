class ArticleController < ApplicationController
  def index
    @articles = Article.all
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
    @article = Article.find_by_id(id)
    @category = @article.category
    @categories = Category.all
  end

  def update
  end

  def destroy
  end
end
