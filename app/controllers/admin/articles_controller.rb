class Admin::ArticlesController < AdminController
  def update
    @article = Article.find params[:id]
    @article.update_attributes!(params[:article])
    flash[:notice] = "#{@article.title} was successfully updated."
    redirect_to root_path()
  end
end
