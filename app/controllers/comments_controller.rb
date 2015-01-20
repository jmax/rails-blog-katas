class CommentsController < ApplicationController
  expose(:article)
  expose(:comments, ancestor: :article)
  expose(:comment, attributes: :comment_params)

  def create
    if comment.save
      redirect_to article, notice: "Comment has been posted!"
    else
      redirect_to article, notice: "We couldn't post your comment :("
    end
  end

protected

  def comment_params
    params.require(:comment).permit(:author, :body)
  end

end
