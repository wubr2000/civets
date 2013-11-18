class Notifier < ActionMailer::Base
  default from: "Civet <civet@munat.com>"
  
  def password_reset_request(user)
    @user = user
    
    mail to: @user.email, subject: "[Civet] Reset your credentials"
  end
  
  def password_reset(user)
    @user = user
    
    mail to: @user.email, subject: "[Civet] Your password was reset"
  end
  
  def registration_request(registrant)
    @registrant = registrant
    
    mail to: @registrant.email, subject: "[Civet] Complete your registration"
  end
  
  def registration(user)
    @user = user
    
    mail to: @user.email, subject: "[Civet] Thank you for registering"
  end
end