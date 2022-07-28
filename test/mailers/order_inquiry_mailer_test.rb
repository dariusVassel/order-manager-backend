require "test_helper"

class OrderInquiryMailerTest < ActionMailer::TestCase
  test "send_inquiry" do
    mail = OrderInquiryMailer.send_inquiry
    assert_equal "Send inquiry", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
