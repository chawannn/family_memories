class Public::CommentsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @comment = current_member.comments.new(comment_params)
    @comment.event_id = @event.id
    if @comment.save
      flash[:notice] = "投稿しました"
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "投稿に失敗しました"
      render "public/events/show"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @event = @comment.event
    @comment.destroy if @comment
    redirect_to event_path(@event)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
