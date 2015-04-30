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
			title = p.css('.info>h2>a')[i].text
			url = p.css('#grid-container div.grid-item div.img-thumbnail')[i]['style'].match(/\'(.+)\'/)
			img_url = url[1]
			open_url = img_url.match(/(.+)\.jpg/)
			Todo.create(name: title, image: open_url[0])
			i += 1
		end
	end

	task :populate_travel_deals => :environment do
		CouponParser.new.populate_travels
	end

	task :slack => :environment do
    a = Slack.client
    list = a.users_list
    list['members'].each do |slack_user|
    User.create(name: slack_user['real_name'],
                first_name: slack_user['profile']['first_name'],
                email: slack_user['profile']['email'],
              user_img_url: slack_user['profile']['image_72'])
    end
  end

  task :give_names_to_slack => :environment do
  	dummie_users = User.where('email ~* :pat', :pat => '^.+@flatironschool.com$')
  	dummie_users.each do |slack_user|
	  	if slack_user.name == ("") || slack_user.name == nil
		  	new_name = slack_user.email.match(/^(.+)@flatironschool.com$/)[1]
			  if new_name.include?(".")
			  	new_name = new_name.gsub(".", " ").titleize
			  end
		  	slack_user.name = new_name
		  	slack_user.save
		  end
	  end
	end

	task :give_rand_todos => :environment do
		dummie_users = User.where('email ~* :pat', :pat => '^.+@flatironschool.com$')
		dummie_users.each do |slack_user|
			slack_user.todos << Todo.all.sample(rand(4..20))
			slack_user.todos.uniq!{|todo| todo.id }
		end
	end


	task :give_gmailers_todos => :environment do
		dummie_users = User.where('email ~* :pat', :pat => '^.+@gmail.com$')
		dummie_users.each do |slack_user|
			slack_user.todos << Todo.all.sample(rand(4..20))
			slack_user.todos.uniq!{|todo| todo.id }   
		end
	end

end
