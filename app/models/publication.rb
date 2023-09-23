class Publication < ApplicationRecord
  belongs_to :user

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id
end
