class InviteMailer < ApplicationMailer
  default from: "matthew@kaliara", template_path: 'mailers/invite'

  before_action {
    @user = params[:user]
  }

  def new_invite_email
    mail(subject: "(ADMIN) new account sign up")
  end
end
