class Api::ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :update, :destroy]

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = Exercise.where(class_room_id: params[:class_room_id]).order(created_at: :desc).page params[:page]
  end
  
  def my_exercises
    @class_rooms = current_user.class_rooms.pluck(:id)
    
    if current_user.role == "groups"
      @class_rooms = current_user.group.class_room_id
    end
    
    @exercises = Exercise.where("exercises.class_room_id in (?)", @class_rooms).order(created_at: :desc).page params[:page]

    render :index
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render :show, status: :created
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercises/1
  # PATCH/PUT /exercises/1.json
  def update
    if @exercise.update(exercise_params)
      render :show, status: :ok
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_params
      params.require(:exercise).permit(:file, :title, :description, :class_room_id)
    end
end
