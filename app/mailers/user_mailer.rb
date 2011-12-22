class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://pavlove.heroku.com"
    mail(:to => user.email, :subject => "Welcome to Pavlove")
  end
  
  def pav_email(user)
      @user = user
      @url = "http://pavlove.heroku.com"
      mail(:to => user.email, :subject => "Gratitude")
    end
end
