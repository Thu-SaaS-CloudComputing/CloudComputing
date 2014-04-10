class CommentsController < ApplicationController
  def create
    tem_usr = get_temporary_user
    new_comment = Hash.new
    new_comment[:content] = params[:content]
    new_comment[:user_id] = tem_usr.id
    comment = Comment.create!(new_comment)
    tem_usr.comments << comment
    redirect_to :back
  end
end
