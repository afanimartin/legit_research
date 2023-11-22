class Avo::Resources::Reply < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :content, as: :textarea
    field :comment, as: :belongs_to
  end
end
