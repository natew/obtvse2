class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password_email(user)
    mail(to: user.email, subject: "Reset password email")
  end
end
