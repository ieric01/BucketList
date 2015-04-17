class EventsController < ApplicationController

  def list_events
    @event = Event.new
    @events = Todo.find_by(:name => params['todo']).events

  end

  def create

    Event.create(:name => params['event']['name'], 
                 :location => params['event']['location'], 
                 :date => params['event']['date'], 
                 :time => params['event']['time'], 
                 :user_id => params['event']['user_id'], 
                 :todo_id => params['event']['todo_id'], 
                 :notes => params['event']['notes'])

    redirect_to :back
  end

  def show

  end


end
