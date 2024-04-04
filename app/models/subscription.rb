class Subscription < ApplicationRecord
  belongs_to :user

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id

  def active?
    approved && end_date >= Date.today
  end

  def expired?
    end_date < Date.today
  end
end
