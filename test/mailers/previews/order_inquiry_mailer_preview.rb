# Preview all emails at http://localhost:3000/rails/mailers/order_inquiry_mailer
class OrderInquiryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_inquiry_mailer/send_inquiry
  def send_inquiry
    OrderInquiryMailer.with(user: User.first, order_inquiry: OrderInquiry.first).send_inquiry
  end

end
