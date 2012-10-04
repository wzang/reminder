#File: ar_view.rb
require_relative "ar_model"

class Task < ActiveRecord::Base
end

TasksTableScript.up
puts "Please select a function:(parameters in quotes)
      add a task -- add(event,time,true/false)
      mark a task as completed -- check(event)
      list all tasks -- list
      exit the reminder -- exits"

def add(title,time,finished)
  Task.new(title: title, time: time.to_s, completion: finished).save
end

def check(title)
  @task = Task.find_by_title(title)
  @task.update_attribute(:completion, "true")
end

def list
  puts "TITLE	TIME	COMPLETION"
  tasks = Task.all
  tasks.each do |t|
    puts"#{t.title}	#{t.time}	#{t.completion}"
  end
  puts "END OF LIST"
end

def exits
  TasksTableScript.down
  exit
end
