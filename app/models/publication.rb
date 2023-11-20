class Publication < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :abstract, presence: true
  validates :content, presence: true

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id
end
