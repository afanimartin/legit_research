class Avo::Resources::ExpiredSubscription < Avo::BaseResource
  self.includes = []

  def fields
    field :id, as: :id
    field :user_id, as: :string
    field :start_date, as: :date
    field :end_date, as: :date
    field :approved, as: :boolean
    field :subscription_created, as: :datetime
    field :subscription_type, as: :text
  end
end
