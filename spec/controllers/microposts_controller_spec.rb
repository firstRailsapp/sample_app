require 'spec_helper'

describe MicropostsController do
  
  integrate_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to signin_path
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to signin_path 
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user =test_sign_in( Factory(:user))
      @attr = {:content => "lorem ipsum"}
      @micropost = Factory(:micropost, @attr.merge(:user => @user))
      @user.microposts.stub!(:build).and_return(@micropost)
    end

    describe "failure" do
      before(:each) do
        @micropost.should_receive(:save).and_return(false)
      end

      it "should render the home page" do
        post:create, :micropost => @attr
        # response.should redirect_to signin_path
         response.should render_template('pages/home')
      end
      
    end

    describe "success" do
      before(:each) do
        @micropost.should_receive(:save).and_return(true)
      end

      it "should redirect to the home page" do
        post:create, :micropost => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post:create, :micropost => @attr
        flash[:success].should =~ /Micropost created!/i
      end 
     
    end
    
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @micropost = Factory(:micropost, :user => @user)
      end

      it "should deny access" do
        @micropost.should_not_receive(:destroy)
        delete:destroy, :id => @micropost
        response.should redirect_to(root_path)
    end
  end
  

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @micropost = Factory(:micropost, :user => @user)
        Micropost.should_receive(:find).with(@micropost).and_return(@micropost)
      end

      it "should destroy the micropost" do
        @micropost.should_receive(:destroy).and_return(@micropost)
        delete :destroy, :id => @micropost
      end
    end
  end
  
end
