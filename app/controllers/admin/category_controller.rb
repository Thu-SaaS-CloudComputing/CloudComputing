class Admin::CategoryController < AdminController
  def index
    @categories = []
    Category.find_top_categories.each do
      |t|
      @categories << {:prefix => "- ", :content => t}
      t.push_sub_categories(@categories, 1)
    end
  end
  
  def new_sub
    Category.create!(:name => "(new category)", :parent => params[:id])
    redirect_to admin_category_path()
  end
  
  def upward
    @last = nil
    Category.find_sub_categories(Category.find(params[:id]).parent).each do
      |t|
      if (t.id.to_s == params[:id] and @last != nil)
        @torder = t.order
        t.order = @last.order
        t.save
        @last.order = @torder
        @last.save
      end
      @last = t
    end
    redirect_to admin_category_path()
  end
  
  def downward
    @last = nil
    Category.find_sub_categories(Category.find(params[:id]).parent).each do
      |t|
      if (@last != nil and @last.id.to_s == params[:id])
        @torder = t.order
        t.order = @last.order
        t.save
        @last.order = @torder
        @last.save
      end
      @last = t
    end
    redirect_to admin_category_path()
  end

  def edit
    @category = Category.find params[:id]
  end

  def show
    redirect_to admin_category_path()
  end

  def update
    @category = Category.find params[:id]
    @category.update_attributes!(params[:category])
    flash[:notice] = "#{@category.name} was successfully updated."
    redirect_to admin_category_path()
  end

  def destroy # database leak(remaining )...
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category '#{@category.name}' deleted."
    redirect_to admin_category_path()
  end
  
  def switch_show
    @category = Category.find params[:id]
    @category.switch_show
    flash[:notice] = "Category #{@category.name}'s visibility on index has been switched."
    redirect_to admin_category_path()
  end
end
