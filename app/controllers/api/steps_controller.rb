class Api::StepsController < ApplicationController
  before_action :set_step, only: [:show, :update, :destroy]

  # GET /steps
  # GET /steps.json
  def index
    @steps = Step.where(study_case_id: params[:study_case_id])
  end

  # GET /steps/1
  # GET /steps/1.json
  def show
  end

  # POST /steps
  # POST /steps.json
  def create
    @step = Step.new(step_params)

    if @step.save
      render :show, status: :created
    else
      render json: @step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    if @step.update(step_params)
      render :show, status: :ok
    else
      render json: @step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step).permit(:name, :study_case_id)
    end
end
