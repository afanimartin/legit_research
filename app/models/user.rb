class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
        
  has_many :publications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :citations, dependent: :destroy
  belongs_to :role

  include UniqueId
 
  self.primary_key = :id 
  before_create :generate_unique_id

  # Setup the association where a user has many following relationships
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  # Setup the association where a user has many follower relationships
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # Through relationships
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Helper methods to follow and unfollow users
  def follow(other_user)
    following << other_user unless self == other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

  # def self.from_omniauth(auth)
  #   Rails.logger.debug "Omniauth data: #{auth.inspect}"
  #   user = where(provider: auth.provider).first_or_create do |user|
  #     Rails.logger.debug "Creating user with email: #{auth.info.email}"
  #     user.role_id = 2
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.full_name = auth.info.name # assuming the user model has a name
  #     user.avatar_url = auth.info.image # assuming the user model has an image
  #   end
  #   Rails.logger.debug "User: #{user.inspect}"
  #   user
  # end
end
