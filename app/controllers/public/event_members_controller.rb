class Public::EventMembersController < ApplicationController

  def is_done_create
    event_member = EventMember.find(params[:id])
    event_member.update(is_done: true)
    redirect_back(fallback_location: root_url)
  end

  def is_done_destroy
    event_member = EventMember.find(params[:id])
    event_member.update(is_done: false)
    redirect_back(fallback_location: root_url)
  end
  
  def is_nice_create
    event_member = EventMember.find(params[:id])
    event_member.update(is_nice: true)
    redirect_back(fallback_location: root_url)
  end

  def is_nice_destroy
    event_member = EventMember.find(params[:id])
    event_member.update(is_nice: false)
    redirect_back(fallback_location: root_url)
  end
end
