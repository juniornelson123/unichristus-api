class Api::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @user = User.find current_user.id
  end

  def show
  end

  def students
    if params[:class_rooms].present?
      @users = User.joins(:class_rooms).where("class_rooms_users.class_room_id in (?) and users.role = ?", params[:class_room_id], 0).page params[:page]
    else
      @class_rooms = ClassRoom.where(user_id: current_user.id).pluck(:id)
      @users = User.joins(:class_rooms).where("class_rooms_users.class_room_id in (?) and users.role = ?", @class_rooms, 0).page params[:page]
    end
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
end
