class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = current_user.comments.new(comment_params)

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