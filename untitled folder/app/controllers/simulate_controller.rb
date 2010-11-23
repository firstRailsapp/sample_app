require 'lib/tasks/thread_class.rb'
class SimulateController < ApplicationController
  after_filter :start_thread, :only => [:search]  
  
  def initialize
    @sleep_time = 0.1
  end
  
  def simulate
    @title = "HTTP Polling"
  end    
  
  def search
    $count = 0
    render 'search'    
  end
  
  
  def result
    render 'result'
  end
      
  
  def check_status
    thread_list
    render :text => session[:count]    
  end
        
  
  def start_thread    
    thread = Thread.new do
      while $count < 100 do
        $count += 1
        sleep(@sleep_time)
      end
    end
    session[:current_thread] = thread.object_id
    logger.debug(session[:current_thread])
  end 
    
  def thread_list    
    Thread.list.each do |thread|
      if thread.object_id == session[:current_thread]
        logger.debug(thread.object_id)
        session[:count] = $count
        logger.debug(session[:count])
      end      
    end        
  end
  
end

