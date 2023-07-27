class InviteMailerPreview < ActionMailer::Preview
  def new_invite_email
    InviteMailer.with(user: User.last).new_invite_email
  end
  def reminder_email
    InviteMailer.with(user: User.last).reminder_email
  end
  def confirmation_email
    InviteMailer.with(user: User.find(params[:user_id])).confirmation_email
  end
end
