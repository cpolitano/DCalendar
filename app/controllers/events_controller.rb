class EventsController < ApplicationController

  def index
    @events = Event.where('event_time >= ?', Date.today).order(event_time: :asc)
    @connection = Connection.new
    @new_events = @connection.get_eventbrite_events

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
      @event = Event.new
  end

  def create
      @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Your Event Has Been Created!"
      redirect_to events_path
    else
      flash[:alert] = "There Was a Problem With Your Event. Please Try Again."
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
    redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_time, :location, :link)
  end

end
