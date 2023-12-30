class PublicationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_publication, only: [:show]

  def index
    @q = Publication.ransack(params[:q])
    @publications = @q.result(distinct: true).includes(:user)
  end

  def show
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      redirect_to user_profile_path
    else
      render :new
    end
  end

  def cite
    @publication = Publication.find(params[:publication_id])
    # Create a citation associated with the current user for this publication
    @citation = @publication.citations.new(user: current_user)

    if @citation.save
      redirect_to @publication
    else
      render :new
    end
  end

  private
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def publication_params
      params.require(:publication).permit(:title, :abstract, :content).merge(user_id: current_user.id)
    end
end
