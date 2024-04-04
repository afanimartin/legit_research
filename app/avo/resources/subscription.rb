class Avo::Resources::Subscription < Avo::BaseResource
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :start_date, as: :date
    field :end_date, as: :date
    field :approved, as: :boolean
    field :user, as: :belongs_to
  end
end
