class Public::IsNicesController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    is_nice = current_member.is_nices.new(event_id: event.id)
    is_nice.save
    redirect_to request.referer
  end

  def destroy
    event = Event.find(params[:event_id])
    is_nice = current_member.is_nices.find_by(event_id: event.id)
    is_nice.destroy
    redirect_to request.referer
  end


end
