class UserMailer < ApplicationMailer

 default from: 'notifications@example.com'
 
  def welcome_email(email)
    @email = email
    #@url  = 'http://example.com/login'
    mail(to: @email, subject: 'Welcome to My Awesome Site')
  end
end
