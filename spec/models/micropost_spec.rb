require 'spec_helper'

describe Micropost do
  before(:each) do
    @user = Factory(:user)
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @user.microposts.create!(@attr)
  end
  describe "user association" do
    before(:each) do
      @micropost = @user.microposts.create(@attr)
    end

    it "should have a user association" do
      @micropost.should respond_to(:user)
    end

    it "should have a right associated user" do
      @micropost.user_id.should == @user.id
      @micropost.user.should == @user
    end
  end

  describe "validation" do
    it "should require a user id" do
      Micropost.new(@attr).should_not be_valid
    end

    it "should require a nonbank content" do
      @user.microposts.build(:content => " ").should_not be_valid
    end

    it "should reject the long content" do
      @user.microposts.build(:content => "a" * 141).should_not be_valid
    end
  end
  
      
end
