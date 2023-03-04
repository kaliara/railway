class InviteMailerPreview < ActionMailer::Preview
  def new_invite_email
    InviteMailer.with(user: User.last).new_invite_email
  end
end
