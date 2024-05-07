class Public::EventsController < ApplicationController
  before_action :authenticate_member!

  def new
    @event = Event.new(start_time: params[:start_time])
  end

  def create
    @event = current_member.events.build(event_params)
    if @event.save
      flash[:notice] = "登録しました"
      redirect_to events_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def index
    families_ids = current_member.families.ids
    @events = Event.where(member_id: families_ids)
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "更新しました"
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "更新に失敗しました"
      redirect_to edit_event_path
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :start_time, :end_time, assign_member_ids: [])
  end

end
