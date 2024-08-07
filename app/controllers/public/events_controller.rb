class Public::EventsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :correct_member, only: [:edit, :update, :destroy]
  before_action :correct_family, only: [:show]

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
    @events = Event.where(member_id: families_ids).includes(:event_members)
    if params[:status].present?
      done_ids = @events.map { |o| [ o[:id], o.event_members.pluck(:is_nice, :is_done).flatten.uniq ] }.select { |a| a.last.size == 1 && a.last.first }.map { |o| o.first }
      not_yet_ids = @events.joins(:event_members).where('event_members.member_id': current_member.id).ids - done_ids
      @events = @events.where(id: done_ids) if params[:status] == "done"
      @events = @events.where(id: not_yet_ids) if params[:status] == "not_yet"
    end
  end

  def show
    @comment = Comment.new
    @event.notifications.where(member_id: current_member.id)&.update_all(is_read: true)
    @event.event_members.includes(:notifications).find_by('notifications.member_id': current_member.id)&.notifications&.update_all(is_read: true)
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "更新しました"
      redirect_to event_path(@event)
    else
      flash.now[:alert] = "更新に失敗しました"
      redirect_to edit_event_path
    end
  end

  def destroy
    event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :start_time, :end_time, assign_member_ids: [], images: [])
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
  
  def correct_member
    if @event.member != current_member
      redirect_to root_path
    end
  end
  
  def correct_family
    if !current_member.families.include?(@event.member)
      redirect_to root_path
    end
  end
end
