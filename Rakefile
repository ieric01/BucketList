# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks
require 'open-uri'
require 'nokogiri'
require 'rake'

namespace :seed do 


	
	task :populate_todo => :environment do
		p = Nokogiri::HTML(open("http://bucketlist.org/featured/"))
		i = 0
		while p.css('.info>h2>a')[i].text
			binding.pry
			# Todo.create(name: )
			i += 1
		end
	end
end
