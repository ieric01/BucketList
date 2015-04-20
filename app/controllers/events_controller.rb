class EventsController < ApplicationController

  def list_events
    @event = Event.new
    @events = Todo.find_by(:name => params['todo']).events

  end

  def create

    event = Event.create(:name => params['event']['name'], 
                 :location => params['event']['location'], 
                 :date => params['event']['date'], 
                 :time => params['event']['time'], 
                 :user_id => params['event']['user_id'], 
                 :todo_id => params['event']['todo_id'], 
                 :notes => params['event']['notes'])
    #Event.find(params['event']['user_id']).event_users.create(:user_id => current_user.id)
    event.event_users.create(:user_id => current_user.id)

    
    binding.pry

    redirect_to :back
  end

  def show

  end

  def rsvp
    EventUser.create(:event_id => params['event_id'].to_i, :user_id => current_user.id)
    redirect_to :back
  end

  def attendees_list
    @attendees = Event.find(params['event_id']).users.uniq
    
  end


end
