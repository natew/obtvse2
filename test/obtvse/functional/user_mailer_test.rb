require 'test_helper'

module Obtvse
  class UserMailerTest < ActionMailer::TestCase
    test "reset_password_email" do
      skip('not yet ready')
      mail = UserMailer.reset_password_email(user)
      assert_equal "Reset password email", mail.subject
      assert_equal ["to@example.org"], mail.to
      assert_equal ["from@example.com"], mail.from
      assert_match "Hi", mail.body.encoded
    end

  end
end
