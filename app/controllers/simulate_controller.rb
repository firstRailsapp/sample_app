require 'simulate_helper.rb'
class SimulateController < ApplicationController
  after_filter :start_thread, :only => [:search]
  attr_reader :count
  def initialize
    @sleep_time = 0.5
    @count = 0
  end
  
  def simulate
    @title = "HTTP Polling"
  end    
  
  def search    
    $index = 0      
    render 'search'    
  end
  
  
  def result
    render 'result'
  end
    
  def start_thread        
    $thread = Thread.new do
      def count        
          @count += 10
      end
      while @count < 100 do        
        logger.debug("thread calling")
        sleep(@sleep_time)
        @count = count                
      end
      
    end      
    logger.debug($thread)
    session[:thread_id] = $thread.id
  end
  
  def check_status        
    logger.debug(session[:thread_id])
    render :text => ""
  end
      
end
