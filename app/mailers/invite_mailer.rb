class InviteMailer < ApplicationMailer
  default from: "matthew@kaliara", template_path: 'mailers/invite'

  before_action {
    @user = params[:user]
  }

  def new_invite_email
    mail(subject: "You're invited to Elyse & Matthew's wedding weekend!")
  end
end
