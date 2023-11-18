class Avo::Resources::Comment < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :content, as: :text
    field :user, as: :belongs_to
  end
end
