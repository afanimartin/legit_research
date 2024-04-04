namespace :subscriptions do
  desc "Archive and remove expired subscriptions"
  task archive_expired: :environment do
    Subscription.where('end_date < ?', Date.today).find_each do |subscription|
      # Copy the subscription to the ExpiredSubscriptions table
      ExpiredSubscription.create!(
        user_id: subscription.user_id,
        start_date: subscription.start_date,
        end_date: subscription.end_date,
        subscription_days: subscription.subscription_days,
        approved: subscription.approved,
        subscription_created: subscription.created_at,
        subscription_updated: subscription.updated_at,
        subscription_type: subscription.subscription_type
      )
      
      # Delete the original subscription
      subscription.destroy
    end

    puts "Expired subscriptions have been archived and removed."
  end
end
