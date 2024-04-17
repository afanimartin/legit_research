class SubscriptionsController < ApplicationController
  before_action :authenticate_user!


  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.build_subscription(subscription_params)
    @subscription.start_date = Date.today
    @subscription.end_date = Date.today + 30
    @subscription.subscription_days = 30
    @subscription.approved = false # Assuming subscriptions require admin approval
    
    if @subscription.save
      SubscriptionMailer.new_subscription_request(current_user).deliver_now
      redirect_to root_path, notice: "Subscription request submitted successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def approve
    @subscription = Subscription.find(params[:id])
    if @subscription.update(approved: true)
      SubscriptionMailer.subscription_confirmation(@subscription.user).deliver_now
      redirect_to admin_subscriptions_path, notice: 'Subscription approved and confirmation email sent.'
    else
      render :edit, alert: 'There was an issue approving the subscription.'
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
    params.require(:subscription).permit(:subscription_type_id) # Adjust according to your actual model attributes
  end
end
