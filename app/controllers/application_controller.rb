class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def home
    @title = "Pavlove | Home"
  end

  def contact
    @title = "Pavlove | Contact"
  end

  def about
    @title = "Pavlove | About"
  end
  
end
