class Api::EventsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: Event.all
  end

  def show
    event = Event.find(params[:id])
    render json: event
  end

  def create
    event = Event.new(event_params)
    if event.save
      render json: {
        status: 200,
        message: "Successfully created event"
      }.to_json
    else
      render json: {
        status: 500,
        errors: event.errors
      }.to_json
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    render json: {
      status: 200,
      message: "Successfully deleted event"
    }.to_json
  end


  private

  def event_params
    params.require(:event).permit(:name, :description, :event_time, :location, :link)
  end


end