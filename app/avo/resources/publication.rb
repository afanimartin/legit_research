class Avo::Resources::Publication < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :user, as: :belongs_to
    field :comments, as: :has_many
    field :status, as: :belongs_to
  end
end
