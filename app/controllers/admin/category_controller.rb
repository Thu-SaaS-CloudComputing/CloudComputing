class Admin::CategoryController < AdminController
  before_filter :validate_edit, :only => [:new_sub, :edit, :upward, :downward, :switch_show, :update]
  before_filter :validate_delete, :only => :destroy
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

  #def show
  #  redirect_to admin_category_path()
  #end

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

  private
  def validate_edit
    if params[:id] == "0"
      validate_topcategory_edit
    else
      validate_subcategory_edit
    end
  end

  def validate_topcategory_edit
    tem_user = User.find_by_studentID(session[:user])
    priv = Priviledge.find_by_name("edit_all_categories")
    if !tem_user.priviledges.include?(priv)
      falsh[:notice] = "You are not authorized to do so!"
      redirect_to admin_index_path and return
    end
  end
  
  def validate_subcategory_edit
    cat = Category.find(params[:id])
    tem_user = User.find_by_studentID(session[:user])
    priv = Priviledge.find_by_name("edit_category_" + cat.name)
    if !tem_user.priviledges.include?(priv)
      flash[:notice] = "You are not authorized to do so!"
      redirect_to admin_index_path and return
    end
  end

  def validate_delete
    tem_user = User.find_by_studentID(session[:user])
    cat = Category.find(params[:id])
    priv = Priviledge.find_by_name("delete_category_" + cat.name)
    if !tem_user.priviledges.include?(priv)
      flash[:notice] = "You are not authorized to do so!"
      redirect_to admin_index_path and return
    end
  end
  
end
