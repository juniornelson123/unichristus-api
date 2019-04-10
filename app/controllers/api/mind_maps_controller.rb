class Api::MindMapsController < ApplicationController
  before_action :set_mind_map, only: [:show, :update, :destroy]

  
  # GET /mind_maps/1
  # GET /mind_maps/1.json
  def show
  end

  def mind_map_by
    @mind_map = MindMap.where(user_id: current_user.id, study_case_id: params[:id]).last

    render json: @mind_map
  end

  # POST /mind_maps
  # POST /mind_maps.json
  def create
    @mind_map = MindMap.new(mind_map_params)
    @mind_map.user_id = current_user.id 
    if @mind_map.save
      render :show, status: :created
    else
      render json: @mind_map.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mind_maps/1
  # PATCH/PUT /mind_maps/1.json
  def update
    if @mind_map.update(mind_map_params)
      render :show, status: :ok
    else
      render json: @mind_map.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mind_maps/1
  # DELETE /mind_maps/1.json
  def destroy
    @mind_map.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mind_map
      @mind_map = MindMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mind_map_params
      params.require(:mind_map).permit!
    end

end
