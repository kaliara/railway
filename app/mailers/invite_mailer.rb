class InviteMailer < ApplicationMailer
  default template_path: 'mailers/invite'

  before_action {
    @user = params[:user]
  }

  def new_invite_email
    if @user.guest_of_elyse?
      mail(from: "Elyse and Matthew <edolde165@gmail.com>", to: @user.email, subject: "You're invited to Elyse & Matthew's wedding weekend!")
    else
      mail(from: "Elyse and Matthew <matthew@kaliara>", to: @user.email, subject: "You're invited to Elyse and Matthew's wedding weekend!")
    end
  end
end
