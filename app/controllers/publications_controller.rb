class PublicationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :check_subscription, only: [:new, :create]

  def index
    @publications = Publication.where(status_id: 2).order(:created_at => :desc)
  end

  def show
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      cited_publication = Publication.find_by(id: params[:publication][:id])
      Citation.create(publication_id: cited_publication.id, user_id: current_user.id) if cited_publication

      redirect_to user_profile_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publication.update(publication_params)
      redirect_to publication_path(@publication), notice: 'Publication was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @publication.destroy
    redirect_to publications_path, notice: 'Publication was successfully destroyed.'
  end

  private
    def check_subscription
      return unless current_user

      subscription = current_user.subscription

      if subscription.nil?
        redirect_to new_subscription_path, alert: 'Please subscribe to access this content.'
      elsif !subscription.approved?
        redirect_to subscription_status_path, alert: 'Your subscription is pending approval.'
      elsif subscription.expired?
        redirect_to new_subscription_path, alert: 'Your subscription has expired.'
      end
    end

    def set_publication
      @publication = Publication.find(params[:id])
    end

    def publication_params
      params.require(:publication).permit(:title, :abstract, :content).merge(user_id: current_user.id, status_id: 1)
    end

    def authorize_user!
      redirect_to publications_path, alert: 'You are not authorized to perform this action.' unless @publication.user_id == current_user.id
    end
end
