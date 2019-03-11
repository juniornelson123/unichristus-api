class Api::GroupsController < ApplicationController
  before_action :set_group, only: [:show, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @class_rooms = ClassRoom.where(user_id: current_user.id).pluck(:id)
    if params[:class_room_id].present?
      @groups = Group.where(class_room_id: params[:class_room_id]).order(created_at: :desc).page params[:page]
    else
      @groups = Group.where("groups.class_room_id in (?)", @class_rooms).order(created_at: :desc).page params[:page]
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  def add_student
    @group_user = GroupsUser.new(group_user_params)

    if @group_user.save
      render json: @group_user, status: :created
    else
      render json: @group_user.errors, status: :unprocessable_entity
    end
  end

  def remove_student
    @group_user = GroupsUser.find params[:id]

    @group_user.destroy
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    if @group.save
      render :show, status: :created
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    if @group.update(group_params)
      render :show, status: :ok
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit!
    end

    def group_user_params
      params.require(:group_user).permit!
    end
end
