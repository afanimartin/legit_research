# app/mailers/subscription_mailer.rb

class SubscriptionMailer < ApplicationMailer
  default from: 'support@legitresearch.org'

  def new_subscription_request(user)
    @user = user
    mail(to: 'admin@legitresearch.org', subject: 'New Subscription Request')
  end

  def subscription_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Subscription confirmed')
  end
end
