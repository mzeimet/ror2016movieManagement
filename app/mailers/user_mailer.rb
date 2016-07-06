class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  default to: Proc.new{User.pluck(:email)}

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to the videomanagement Site')
  end

  def actor_added(actor_id)
    @actor_id = actor_id
    mail(subject:"Hello! A new Actor was added!")
  end
end
