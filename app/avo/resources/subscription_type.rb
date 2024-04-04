class Avo::Resources::SubscriptionType < Avo::BaseResource
  self.title = :name
  self.includes = []

  def fields
    field :id, as: :id
    field :name, as: :text
    field :price, as: :number
    field :description, as: :textarea
  end
end
