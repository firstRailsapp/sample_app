require 'lib/tasks/thread_class.rb'
class SimulateController < ApplicationController
  after_filter :start_thread, :only => [:search]  
  def initialize
    @sleep_time = 0.2
  end
  
  def simulate    
    @title = "HTTP Polling"    
  end    
  
  def search    
    render 'search'    
  end
    
  def result    
    render 'result'
  end
      
  
  def check_status
    sleep(@sleep_time)
    session[:count] = session[:object].start_count    
    render :text => session[:count]    
  end
          
  def start_thread        
    session[:object] = Counter.new       
  end 
      
  
end

