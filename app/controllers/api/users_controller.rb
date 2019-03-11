class Api::UsersController < ApplicationController
  def index
    @user = User.find current_user.id
  end

  def students
    @class_rooms = ClassRoom.where(user_id: current_user.id).pluck(:id)
    @users = User.joins(:class_rooms).where("class_rooms_users.class_room_id in (?) and users.role = ?", @class_rooms, 0).page params[:page]
  end
end
