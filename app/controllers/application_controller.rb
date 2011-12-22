class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end
  
end
