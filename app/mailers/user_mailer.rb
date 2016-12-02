class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  # Sends email to the user when he is followed by a follower
  def followed_by_user(user, follower)
    @user = user
    @follower = follower
    mail to: user.email, subject: "Você tem um novo seguidor"
  end
end
