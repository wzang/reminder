#File: ar_model.rb
require "active_record"

#Adapter for the SQLite3
ActiveRecord::Base::establish_connection(:adapter => "sqlite3",
                                         :database => "testdb.sqlite")

#Define database schema, and create database "tasks"
class TasksTableScript < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
      t.datetime :time
      t.string :completion
    end
  end

  def self.down
    drop_table :tasks
  end
end
