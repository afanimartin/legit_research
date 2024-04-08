# app/mailers/subscription_mailer.rb

class SubscriptionMailer < ApplicationMailer
  default from: 'support@legitresearch.org'

  def new_subscription_request(user)
    @user = user
    mail(to: 'admin@legitresearch.org', subject: 'New Subscription Request')
  end
end
