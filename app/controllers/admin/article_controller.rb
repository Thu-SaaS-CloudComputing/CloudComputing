class Admin::ArticleController < AdminController
  def new
    @categories = Category.all
  end
end

