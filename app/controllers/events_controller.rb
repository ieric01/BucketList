class EventsController < ApplicationController


  def new
    @event = Event.new
    render 'new_event'
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

    @events = Todo.find_by(:id => params['event']['todo_id']).events

    #rendering show page of all created events works at this point.
    #However, the url convention should be 
    # render "show"
    redirect_to "/todos/#{event.todo_id}/events/list"
  
    # redirect_to :back
  end

  def list_events
    @events = Todo.find(params['todo_id']).events
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

  def leave_event
    Event.find(params['event_id']).users.delete(current_user)
    redirect_to :back
  end


end
