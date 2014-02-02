class Admin::ArticleController < AdminController
  def index
    @articles = Article.all
  end
  
  def update
    @article = Article.find params[:id]
    all_tags = Tag.sanitize(params[:article][:tags])
    #params[:article][:tags] = all_tags
    @article.update_tags(all_tags)
    @article.save!
    params[:article].delete(:tags)
    @article.update_attributes!(params[:article])
    flash[:notice] = "#{@article.title} was successfully updated."
    redirect_to edit_admin_article_path(@article)
  end
  
  def edit
    @article = Article.find params[:id]
    @all_tag_string = String.new
    if @article.tags
      @article.tags.each do |tag|
        @all_tag_string += (tag.name + ", ")
      end
    end
  end
  
  def destroy
    article = Article.find params[:id]
    article.destroy
    flash[:notice] = "Article '#{article.title}' deleted."
    redirect_to admin_article_path()
  end
  
  def add
    article = Article.create(:category => (Article.find params[:id]).category)
    redirect_to edit_admin_article_path(article)
  end
  
end
