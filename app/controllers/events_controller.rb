class EventsController < ApplicationController
  def index
    @events = Current.user.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if Event.create(name: @event.name, start_time: @event.start_time, end_time: @event.end_time, user: Current.user)
      redirect_to events_path
    else
      @event.errors.full_messages
      redirect_to new_event_path
    end
  end

private

  def event_params
    params.expect(event: [ :name, :start_time, :end_time ])
  end
end
