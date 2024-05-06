class IsNiceController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    is_nice = current_member.is_nice.new(event_id: event.id)
    is_nice.save
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:event_id])
    is_nice = current_member.is_nice.find_by(event_id: event.id)
    is_nice.destroy
    redirect_to event_path(event)
  end


end
