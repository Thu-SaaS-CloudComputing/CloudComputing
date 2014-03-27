class CommentsController < ApplicationController
  def new
    new_comment = params[:comment]
    Comment.create(new_comment)
  end
end
