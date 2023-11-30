# app/controllers/replies_controller.rb
class RepliesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.find(params[:comment_id])
    @reply = current_user.replies.build(reply_params.merge(comment: @comment))

    if @reply.save
      respond_to do |format|
        format.html { redirect_to @comment, notice: 'Reply was successfully created.' }
        format.js {render inline: "location.reload();" }
      end
    else
      render 'comments/show'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
