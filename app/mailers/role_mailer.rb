class RoleMailer < ActionMailer::Base
  default from: "do.not.reply@aboveallcompassion.com"
  layout 'email'

  def authorized(user)
    @user = user
    mail to: user.email,
      subject: "Account Authorization"
  end

  def unauthorized(user)
    @user = user
    mail to: user.email,
      subject: "Account De-Authorization"
  end
end
