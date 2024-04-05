# app/mailers/subscription_mailer.rb

class SubscriptionMailer < ApplicationMailer
  default from: 'researchlegit@gmail.com'

  def new_subscription_request(user)
    @user = user
    mail(to: 'afanimartin@gmail.com', subject: 'New Subscription Request')
  end
end
