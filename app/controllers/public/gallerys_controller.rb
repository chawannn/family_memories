class Public::GallerysController < ApplicationController

  def index
    @events = Event.where(member_id: current_member.families)
  end
end
