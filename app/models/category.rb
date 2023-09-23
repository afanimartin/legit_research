class Category < ApplicationRecord
  has_many :users

  validates :name, presence: true

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id
end
