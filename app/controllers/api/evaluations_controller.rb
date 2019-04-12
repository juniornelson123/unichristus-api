class Api::EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :update, :destroy]

  # GET /evaluations
  # GET /evaluations.json
  def index
    
    @evaluation = Evaluation.find_by(user_id: params[:user_id], study_case_id: params[:study_case_id])

    if @evaluation.present?
      render :show
    else
      render json: nil
    end
      
  end
  
  def get_my_evaluation
    
    @evaluation = Evaluation.find_by(user_id: current_user.id, study_case_id: params[:study_case_id])

    render :show

  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)

    if @evaluation.save
      render :show, status: :created
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    if @evaluation.update(evaluation_params)
      render :show, status: :ok
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:value, :study_case_id, :user_id)
    end
end
