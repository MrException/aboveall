class RoleMailer < ActionMailer::Base
  default from: "no-reply@aboveallcompassion.com"
  layout 'email'

  def authorized(user)
    @user = user
    mail to: user.email,
      subject: "Account Authorization"
  end
end
