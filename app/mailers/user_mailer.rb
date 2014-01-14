class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def confirmation_email(user)
    @user = user
    mail(:to => user.email, :subject => "Please Activate Your Account")
  end
  
end