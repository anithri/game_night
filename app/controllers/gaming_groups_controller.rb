class GamingGroupsController < ApplicationController
  before_action :set_gaming_group, only: [:show, :edit, :update, :destroy]

  # GET /gaming_groups
  # GET /gaming_groups.json
  def index
    @gaming_groups = GamingGroup.all
  end

  # GET /gaming_groups/1
  # GET /gaming_groups/1.json
  def show
  end

  # GET /gaming_groups/new
  def new
    @gaming_group = GamingGroup.new
  end

  # GET /gaming_groups/1/edit
  def edit
  end

  # POST /gaming_groups
  # POST /gaming_groups.json
  def create
    @gaming_group = GamingGroup.new(gaming_group_params)

    respond_to do |format|
      if @gaming_group.save
        format.html { redirect_to @gaming_group, notice: 'Gaming group was successfully created.' }
        format.json { render :show, status: :created, location: @gaming_group }
      else
        format.html { render :new }
        format.json { render json: @gaming_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gaming_groups/1
  # PATCH/PUT /gaming_groups/1.json
  def update
    respond_to do |format|
      if @gaming_group.update(gaming_group_params)
        format.html { redirect_to @gaming_group, notice: 'Gaming group was successfully updated.' }
        format.json { render :show, status: :ok, location: @gaming_group }
      else
        format.html { render :edit }
        format.json { render json: @gaming_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gaming_groups/1
  # DELETE /gaming_groups/1.json
  def destroy
    @gaming_group.destroy
    respond_to do |format|
      format.html { redirect_to gaming_groups_url, notice: 'Gaming group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gaming_group
      @gaming_group = GamingGroup.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gaming_group_params
      params.require(:gaming_group).permit(:name, :description, :owner_id)
    end
end
