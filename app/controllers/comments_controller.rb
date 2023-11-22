class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment.publication, notice: "comment submitted successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:publication_id, :user_id, :content)
    end
end