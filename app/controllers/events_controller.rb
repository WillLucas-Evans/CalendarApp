class EventsController < ApplicationController
  def index
    @events = Current.user.events
    @sorted_events = Hash[]

    if params[:date]
      @focused_date = Time.at(params[:date].to_i).to_datetime.beginning_of_day
    else
      @focused_date = DateTime.now.beginning_of_day
    end

    for event in @events do
      if !@sorted_events[event.start_time.beginning_of_day.to_datetime]
        @sorted_events[event.start_time.beginning_of_day.to_datetime] = [ event ]
      else
        @sorted_events[event.start_time.beginning_of_day.to_datetime].push(event)
      end
    end
  end

  def new
    @event = Event.new
  end

  def edit
    res = Event.find(params[:id])
    if res.user == Current.user
      @event = res
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params) && @event.user == Current.user
      redirect_to events_path
    else
      redirect_to update_event_path(@event)
    end
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end
private

  def event_params
    params.expect(event: [ :name, :start_time, :end_time ])
  end
end
