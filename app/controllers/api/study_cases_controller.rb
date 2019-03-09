class Api::StudyCasesController < ApplicationController
  before_action :set_study_case, only: [:show, :update, :destroy]

  # GET /study_cases
  # GET /study_cases.json
  def index
    if params[:class_room_id].present?
      @study_cases = StudyCase.where(class_room_id: params[:class_room_id]).order(created_at: :desc).page params[:page]
    else
      @study_cases = StudyCase.order(created_at: :desc).page params[:page]
    end
  end

  # GET /study_cases/1
  # GET /study_cases/1.json
  def show
  end

  # POST /study_cases
  # POST /study_cases.json
  def create
    @study_case = StudyCase.new(study_case_params)

    if @study_case.save
      render :show, status: :created
    else
      render json: @study_case.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /study_cases/1
  # PATCH/PUT /study_cases/1.json
  def update
    if @study_case.update(study_case_params)
      render :show, status: :ok
    else
      render json: @study_case.errors, status: :unprocessable_entity
    end
  end

  # DELETE /study_cases/1
  # DELETE /study_cases/1.json
  def destroy
    @study_case.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_case
      @study_case = StudyCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_case_params
      params.require(:study_case).permit!
    end
end
