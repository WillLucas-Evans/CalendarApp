class EventsController < ApplicationController
  def index
    @events = Current.user.events
  end
end
