class Admin::UserController < AdminController
  before_filter :validate
  def index
    @users = User.all
    #@users.each do |user|
    #  @user_priviledge[user] = user.priviledge
    #end
  end

  def show
    @user = User.find(params[:id])
    @priviledges = @user.priviledges
    @all_priviledges = Priviledge.all
  end

  def switch
    priv = Priviledge.find(params[:priviledge])
    user = User.find(params[:id])
    if(user.has_priviledge?(priv))
      user.priviledges.delete(priv)
    else
      user.priviledges << priv
    end
    redirect_to admin_user_path(:id => user.id)
  end

  def validate
    tem_user = User.find_by_studentID(session[:user])
    priv = Priviledge.find_by_name("user_management")
    if !tem_user.priviledges.include?(priv)
      flash[:notice] = "You are not authorized to to do"
      redirect_to admin_index_path and return
    end
  end
  #def authorize
  #  priv = Priviledge.find(params[:priviledge])
  #  user = User.find(params[:id])
  #  if(!user.has_priviledge?(priv))
  #    user.priviledges << priv
  #  end
  #  redirect_to admin_user_path(:id => user.id)
  #end

  #def unauthorize
  #  priv = Priviledge.find(params[:priviledge])
  #  user = User.find(params[:id])
  #if(user.has_priviledge)
  #  end
  #end
end
