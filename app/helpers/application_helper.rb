# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title
    @base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      @base_title
    else
      "#{@base_title} | #{h(@title)}"
    end
  end

  def logo
    image_tag("logo1.jpg", :alt => "Sample App", :class => "round")
  end

  def progress_status
    @progress_bar
  end
end
