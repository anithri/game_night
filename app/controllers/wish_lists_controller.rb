class WishListsController < ApplicationController
  before_action :set_wish_list, only: [:show, :edit, :update]
  respond_to :html,:js,:json
  # GET /wish_lists
  # GET /wish_lists.json
  def index
    @wish_lists = policy_scope(WishList).includes(:game_summaries).all
  end

  # GET /wish_lists/1
  # GET /wish_lists/1.json
  def show
    authorize @wish_list
    results =  WithGameSummaries::SearchAndPaginate.call(params:        params,
                                                        initial_scope: @wish_list.game_summaries,
                                                        init_search: { wish_list_items_wish_list_id_in_all: [@wish_list.id] }
    )

    @q              = results.q
    @game_summaries = results.game_summaries
  end

  # PATCH/PUT /wish_lists/1
  # PATCH/PUT /wish_lists/1.json
  def update
    authorize @wish_list
    results = WithWishList::UpdateItems.call(wish_list: @wish_list, cache: Rails.cache,
                                                game_summary_ids: wish_list_params[:game_summary_ids],
    )
    respond_to do |format|
      if results.success?
        format.html { redirect_to @wish_list, notice: 'Game library was successfully updated.' }
        format.json { render :show, status: :ok, location: @wish_list }
        format.js {flash[:notice] = results.notice}
      else
        format.html { redirect_to @wish_list, notice: "Could not add item: #{results.error}." }
        format.json { render json: results.error, layout: false, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish_list
      @wish_list = WishList.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_list_params
      params.require(:wish_list).permit(:game_summary_ids)
    end
end
