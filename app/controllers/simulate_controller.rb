require 'thread'
class SimulateController < ApplicationController
 # after_filter :start_thread, :only => [:search]
  
  def initialize
    @sleep_time = 1    
  end
  
  def simulate
    @title = "HTTP Polling"
  end    
  
  def search        
    render 'search'
    start_thread(false)
  end
  
  
  def result
    render 'result'
  end
    
  
  
  def check_status
    @thread_ids = []
    @thread_ids = thread_list
    start_thread(true)    
    logger.debug(session[:count])
    if @thread_ids.include?(session[:current_thread])
      render :text => session[:count]
    else
      render :text => nil
    end    
    
  end
  
  def start_thread(cond)
    if cond == false
      $count = 0
      thread = Thread.new do
        while $count < 100 do        
          sleep(@sleep_time)
          $count += 10  
        end
      end
      session[:current_thread] = thread.id
    end       
    session[:count] = $count
    
  end
  
  def thread_list
    @threads = []
    Thread.list.each do |thread|
      @threads << thread.id
    end    
    @threads
  end
  
      
end

