require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "reset_password_email" do
    mail = UserMailer.reset_password_email(users(:saint))
    assert_equal "Reset password email", mail.subject
    assert_equal ["saint@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
