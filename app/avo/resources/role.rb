class Avo::Resources::Role < Avo::BaseResource
  self.title = :name
  self.includes = []

  def fields
    field :name, as: :name
  end
end