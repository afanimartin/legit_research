class Avo::Resources::Relationship < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :follower_id, as: :text
    field :followed_id, as: :text
  end
end
