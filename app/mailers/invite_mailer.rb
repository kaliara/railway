class InviteMailer < ApplicationMailer
  default from: "Matthew and Elyse <matthew@kaliara>", template_path: 'mailers/invite'

  before_action {
    @user = params[:user]
  }

  def new_invite_email
    mail(to: @user.email, subject: "You're invited to Elyse & Matthew's wedding weekend!")
  end
end
