class Api::StudyCasesController < ApplicationController
  before_action :set_study_case, only: [:show, :update, :destroy]

  # GET /study_cases
  # GET /study_cases.json
  def index
    @class_rooms = ClassRoom.where(user_id: current_user.id).pluck(:id)
    if params[:is_student].present?
      @class_rooms = current_user.class_rooms.pluck(:id)
    end

    if params[:class_room_id].present?
      @study_cases = StudyCase.where(class_room_id: params[:class_room_id]).order(created_at: :desc).page params[:page]
    else
      @study_cases = StudyCase.where("study_cases.class_room_id in (?)", @class_rooms).order(created_at: :desc).page params[:page]
    end
  end

  def get_my_study_cases
    @class_rooms = User.find(params[:id]).class_rooms.pluck(:id)

    @study_cases = StudyCase.where("study_cases.class_room_id in (?)", @class_rooms).order(created_at: :desc).page params[:page]

    render :index
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
