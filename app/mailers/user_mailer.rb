class UserMailer < ApplicationMailer
    default from: 'samarth@with-the-tide.com'

    def welcome_email
      @user = params[:user]
      @user_info = params[:user_info]
      @url  = 'http://example.com/login'
      #mail(to: @user.user_info.email, subject: 'Welcome to My Awesome Site')
    attachments["with-the-tide-logo.png"] = File.read("app/assets/images/with-the-tide-logo.png")

      mail(
        from: 'Samarth <no-reply@with-the-tide.com>',
        to: @user.username, 
        subject: 'Welcome to Withthetide'
        )
    end
end
