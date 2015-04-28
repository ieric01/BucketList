class Event < ActiveRecord::Base
  has_many :event_users
  has_many :users, :through => :event_users
  belongs_to :todo

  #VALIDATES ALL FIELDS ARE FILLED, AND SHOW ERROR 'FIELD CANT BE BLANK' IN VIEWS
  
  # validates_presence_of :name, :location, :date, :time, :notes, :message => "field can't be blank"
end
