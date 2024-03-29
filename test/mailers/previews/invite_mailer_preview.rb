class InviteMailerPreview < ActionMailer::Preview
  def new_invite_email
    InviteMailer.with(user: User.last).new_invite_email
  end
  def reminder_email
    InviteMailer.with(user: User.last).reminder_email
  end
  def confirmation_email
    InviteMailer.with(user: User.find(69)).confirmation_email
  end
  def final_email
    InviteMailer.with(user: User.find(89)).final_email
  end
end
