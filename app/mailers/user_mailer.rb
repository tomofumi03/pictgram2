class UserMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: 'ご登録ありがとうございます！')
  end
end
