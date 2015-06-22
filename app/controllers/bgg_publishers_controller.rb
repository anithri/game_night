class BggPublishersController < ApplicationController
  before_action :set_bgg_publisher, only: [:show, :edit, :update, :destroy]

  # GET /bgg_publishers
  # GET /bgg_publishers.json
  def index
    q_param = params[:q] || {}
    page = params[:page]
    per_page = params[:per_page]
    @q = policy_scope(BggPublisher).ransack q_param
    @q.sorts = 'name asc' if @q.sorts.empty?
    @bgg_publishers = @q.result(distinct: true).page(page).per(per_page).decorate
  end

  # GET /bgg_publishers/1
  # GET /bgg_publishers/1.json
  def show
    authorize @bgg_publisher
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bgg_publisher
    @bgg_publisher = BggPublisher.find(params[:id]).decorate
  end
end
