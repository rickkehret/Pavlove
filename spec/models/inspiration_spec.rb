require 'spec_helper'

describe Inspiration do

  before(:each) do
    @user = Factory(:user)
    @attr = { :body => "value for body", :author => "author name" }
  end

  it "should create a new instance given valid attributes" do
    @user.inspirations.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @inspiration = @user.inspirations.create(@attr)
    end

    it "should have a user attribute" do
      @inspiration.should respond_to(:user)
    end

    it "should have the right associated user" do
      @inspiration.user_id.should == @user.id
      @inspiration.user.should == @user
    end
  end
 
  describe "validations" do

    it "should require a user id" do
      Inspiration.new(@attr).should_not be_valid
    end

    it "should require nonblank body" do
      @user.inspirations.build(:body => "  ").should_not be_valid
    end

    it "should reject long body" do
      @user.inspirations.build(:body => "a" * 301).should_not be_valid
    end
  end
end
