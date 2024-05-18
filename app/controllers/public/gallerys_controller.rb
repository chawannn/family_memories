class Public::GallerysController < ApplicationController

  def index
    @events = Event.all
  end
end
