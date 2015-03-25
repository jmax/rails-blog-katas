class CommentsController < ApplicationController
  expose(:article)
  expose(:comments, ancestor: :article)
  expose(:comment, attributes: :comment_params)
  expose(:success) { comment.save }

  respond_to :js

  def create; end

protected

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
