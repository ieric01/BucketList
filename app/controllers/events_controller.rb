class EventsController < ApplicationController

  def list_events
    @event = Event.new
    @events = Event.all

  end

  def create

    Event.create(:name => params['event']['name'], 
                 :location => params['event']['location'], 
                 :date => params['event']['date'], 
                 :time => params['event']['time'], 
                 :notes => params['event']['notes'])

    redirect_to :back
  end

  def show

  end


end
