class Admin::UserController < ApplicationController
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
