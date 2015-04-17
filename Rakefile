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
		while p.css('.info>h2>a')[i] != nil
			# binding.pry
			title = p.css('.info>h2>a')[i].text
			url = p.css('#grid-container div.grid-item div.img-thumbnail')[i]['style'].match(/\'(.+)\'/)
			img_url = url[1]
			# binding.pry
			#test
			Todo.create(name: title, image: img_url)
			i += 1
		end
	end
end
