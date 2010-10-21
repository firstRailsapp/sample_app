require 'spec_helper'

describe UserController do
  integrate_views
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    it "should have a right title" do
      get 'new'
      response.should have_tag("title", /Sign up/)
    end
  end
end
