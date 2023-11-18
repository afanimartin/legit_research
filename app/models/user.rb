class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:google_oauth2]
        
  has_many :publications
  belongs_to :role
  belongs_to :category

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id
end
