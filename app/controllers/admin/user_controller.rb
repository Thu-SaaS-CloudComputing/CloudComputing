class Admin::UserController < ApplicationController
  def index
    @users = User.all
    #@users.each do |user|
    #  @user_priviledge[user] = user.priviledge
    #end
  end

  def show
    @user = User.find(params[:id])
    @priviledges = @user.priviledge
  end
end
