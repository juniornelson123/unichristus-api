class Api::ClassRoomsController < ApplicationController
  before_action :set_class_room, only: [:show, :update, :destroy]

  # GET /class_rooms
  # GET /class_rooms.json
  def index
    @class_rooms = ClassRoom.where(user_id: current_user.id).order(created_at: :desc).page params[:page]
  end

  # GET /class_rooms/1
  # GET /class_rooms/1.json
  def show
  end

  def add_student
    @class_room_user = ClassRoomsUser.new(class_room_user_params)

    if @class_room_user.save
      render json: @class_room_user, status: :created
    else
      render json: @class_room_user.errors, status: :unprocessable_entity
    end
  end

  def remove_student
    @class_room_user = ClassRoomsUser.find params[:id]

    @class_room_user.destroy
  end

  # POST /class_rooms
  # POST /class_rooms.json
  def create
    @class_room = ClassRoom.new(class_room_params)
    @class_room.user_id = current_user.id
    if @class_room.save
      render :show, status: :created, location: @class_room
    else
      render json: @class_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /class_rooms/1
  # PATCH/PUT /class_rooms/1.json
  def update
    if @class_room.update(class_room_params)
      render :show, status: :ok, location: @class_room
    else
      render json: @class_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /class_rooms/1
  # DELETE /class_rooms/1.json
  def destroy
    @class_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_room
      @class_room = ClassRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def class_room_params
      params.require(:class_room).permit!
    end
end
