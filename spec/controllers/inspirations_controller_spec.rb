require 'spec_helper'

describe InspirationsController do
  render_views

  describe "access control" do
    
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end
    
    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(Factory(:user))
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = { :body => "", :author => "" }
      end
      
      it "should not create an inspiration" do
        lambda do
          post :create, :inspiration => @attr
        end.should_not change(Inspiration, :count)
      end
      
      it "should render the homepage" do
        post :create, :inspiration => @attr
        response.should render_template('pages/home')
      end
    end
    
    describe "success" do

      before(:each) do
        @attr = { :body => "All you need is love", :author => "John Lennon" }
      end

      it "should create an inpspiration" do
        lambda do
          post :create, :inspiration => @attr
        end.should change(Inspiration, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :inspiration => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :inspiration => @attr
        flash[:success].should =~ /inspiration created/i
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    
    describe "for an unauthorized user" do
      
      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @inspiration = Factory(:inspiration, :user => @user)
      end
      
      it "should deny access" do
        delete :destroy, :id => @inspiration
        response.should redirect_to(root_path)
      end
    end
    
    describe "for an authorized user" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        @inspiration = Factory(:inspiration, :user => @user)
      end
      
      it "should destroy the micropost" do
        lambda do
          delete :destroy, :id => @inspiration
        end.should change(Inspiration, :count).by(-1)
      end
    end
  end
 
end
