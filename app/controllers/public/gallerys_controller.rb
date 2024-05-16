class Public::GallerysController < ApplicationController

  def index
    @events = Event.where(member_id: families_ids)
  end
end
