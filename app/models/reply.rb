class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validates :content, presence: true

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id
end
