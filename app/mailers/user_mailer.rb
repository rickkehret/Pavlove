class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://pavlove.heroku.com"
    mail(:to => user.email, :subject => "Welcome to Pavlove")
  end
  
  def inspiration_email(user)
      @user = user
      @url = "http://pavlove.heroku.com"
      mail(:to => user.email, :from => "The One", :subject => "Gratitude")
  end
end
