
class SimulateController < ApplicationController
  after_filter :start_thread, :only => [:search]  
  def initialize
    @sleep_time = 1
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
        while @count < 100 do          
          @count += 10          
          $counts<< @count          
        end      
    end    
  end
  
  def check_status    
    sleep(@sleep_time)
    logger.debug($index)
    logger.debug($counts[$index])
    render :text => "#{$counts[$index]}"
    $index += 1
  end
    
end
