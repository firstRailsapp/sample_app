
class Counter < Thread
  
  def initialize   
    @count = 0
    @sleep_time = 1
  end
  def run
    while @count < 100
      sleep(@sleep_time)
      @count += 10
    end    
  end

  def get_count
    @count
  end    
    
end
