class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id
end
