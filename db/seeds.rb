# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
list_of_todos= [
  [ "visit germany"],
  [ "go to germany"],
  [ "travel to germany"],

]

list_of_todos.each do |todo|
  Todo.create( name: todo[0])
end

 User.create(name: 'Emanuel')



