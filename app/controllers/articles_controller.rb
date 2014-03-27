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
    @article = Article.find(id)
    
    @comments = @article.comments
    @tags = @article.tags
    @category = @article.category
    @categories = Category.find_top_categories
    
    @trace_category = []
    @trace_category.unshift(@i = @category)
    while @i.parent != 0
      @i = Category.find(@i.parent)
      @trace_category.unshift @i
    end
  end
  
  def raw
    id = params[:id]
    id ||= 0
    @article = Article.find(id)
    render :layout => false
  end

  def tag
    tag_name = params[:tag_name]
    @tag = Tag.find_by_name(tag_name)
    @articles = Tag.get_all_articles(tag_name)
  end

  def update
    print("WTF!!")
  end

  def destroy
  end
end
