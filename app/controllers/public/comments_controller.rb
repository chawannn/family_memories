class Public::CommentsController < ApplicationController

  def create
      event = Event.find(params[:event_id])
      comment = current_member.comments.new(comment_params)
      comment.event_id = event.id
      comment.save
      redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
