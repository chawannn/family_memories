class Public::CommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :correct_member, only: [:edit, :update, :destroy]
  
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
  
  def edit
  end
  
  def update
    @event = @comment.event
    if @comment.update(comment_params)
      flash[:notice] = "編集しました"
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @event = @comment.event
    @comment.destroy if @comment
    redirect_to event_path(@event)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
  def correct_member
    @comment = Comment.find(params[:id])
    if !@comment.deletable_member?(current_member)
      redirect_to root_path
    end
  end
end
