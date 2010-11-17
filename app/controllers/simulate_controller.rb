require 'lib/tasks/thread_class.rb'
class SimulateController < ApplicationController
  after_filter :starting_thread, :only => [:search]  
    
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
    @thread_ids = []
    @thread_ids = thread_list
    if @thread_ids.include?(session[:current_thread])
      render :text => session[:count]    
    end    
    
  end
  
  def starting_thread
    logger.debug(Thread.list)
    obj = Counter.new
    logger.debug(Thread.list)
    session[:current_thread] = obj.object_id    
  end 
    
  def thread_list
    @threads = []
    Thread.list.each do |thread|
      if thread.object_id == session[:current_thread]
       # session[:count] = Counter.start_count        
      end
      @threads << thread.object_id
    end    
    @threads
  end
      
end

