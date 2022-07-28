class OrderInquiryMailer < ApplicationMailer
  default from: 'samarth@with-the-tide.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_inquiry_mailer.send_inquiry.subject
  #
  def send_inquiry
    #@user = User.first.user_info.email
    #@user = params[:user]
    @order_inquiry = params[:order_inquiry]
    attachments["with-the-tide-logo.png"] = File.read("app/assets/images/with-the-tide-logo.png")

    mail(
    from: 'withthetide <no-reply@with-the-tide.com>',
    to: "samarth.gwalani94@gmail.com", 
    subject: 'New Inquiry Update'
    )
  end
end



# def welcome_email
#   @user = params[:user]
#   @user_info = params[:user_info]
#   @url  = 'http://example.com/login'
#   #mail(to: @user.user_info.email, subject: 'Welcome to My Awesome Site')
# attachments["with-the-tide-logo.png"] = File.read("app/assets/images/with-the-tide-logo.png")

#   mail(
#     from: 'Samarth <no-reply@with-the-tide.com>',
#     to: @user.username, 
#     subject: 'Welcome to Withthetide'
#     )
# end