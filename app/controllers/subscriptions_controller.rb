class SubscriptionsController < ApplicationController
  before_action :authenticate_user!


  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.build_subscription(subscription_params)
    @subscription.start_date = Date.today
    @subscription.end_date = Date.today + params[:subscription][:subscription_days].to_i.days
    @subscription.subscription_days = params[:subscription][:subscription_days]
    @subscription.approved = false # Assuming subscriptions require admin approval
    
    if @subscription.save
      redirect_to root_path, notice: "Subscription request submitted successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def status
    @subscription = current_user.subscription

    unless @subscription
      redirect_to new_subscription_path, notice: 'You do not have a subscription request.'
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:subscription_days) # Adjust according to your actual model attributes
  end
end
