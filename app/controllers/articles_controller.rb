class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
 
  def create
    @article = Article.create!(params[:article])
    redirect_to articles_path
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
    @categories = Category.find_top_categories
    
    @trace_category = []
    @trace_category.unshift(@i = @category)
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
