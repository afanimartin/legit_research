class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
        
  has_many :publications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  belongs_to :role

  validates :bio, presence: true

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id

  def self.from_omniauth(auth)
    Rails.logger.debug "Omniauth data: #{auth.inspect}"
    user = where(uid: auth.uid, provider: auth.provider).first_or_create do |user|
      Rails.logger.debug "Creating user with email: #{auth.info.email}"
      user.role_id = 2
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
    end
    Rails.logger.debug "User: #{user.inspect}"
    user
  end
end
