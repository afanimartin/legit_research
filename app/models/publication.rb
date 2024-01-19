class Publication < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :citations, dependent: :destroy

  validates :title, presence: true
  validates :abstract, presence: true

  include UniqueId
 
  self.primary_key = :id
  before_create :generate_unique_id

  has_rich_text :content

  def self.ransackable_associations(*)
    ['user']
  end

  def self.ransackable_attributes(*)
    %w[title abstract]
  end
end
