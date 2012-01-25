require 'spec_helper'

describe "Inspirations" do
  
  before(:each) do
    user = Factory(:user)
    visit signin_path
    fill_in :email,   :with => user.email
    fill_in :password, :with => user.password
    click_button
  end
  
  describe "creation" do
    
    describe "failure" do
      
      it "should not make a new inspiration" do
        lambda do
          visit root_path
          fill_in :inspiration_body, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector("div#error_explanation")
        end.should_not change(Inspiration, :count)
      end
    end
    
    describe "success" do
      
      it "should make a new inspiration" do
        body = "Carpe Diem!"
        lambda do
          visit root_path
          fill_in :inspiration_body, :with => body
          click_button
          response.should have_selector("textarea#inspiration_body", :content => body )
        end.should change(Inspiration, :count).by(1)
      end
      
    end
  end
end
