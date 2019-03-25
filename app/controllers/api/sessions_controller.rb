class Api::SessionsController < ApplicationController
  skip_before_action :authenticate_request
  
  def sign_in
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: {auth_token: command.result[:token], user: command.result[:user]}
    else
      render json: {error: command.errors}, status: :unauthorized
    end
  end

  def sign_up
    @class_room_id = params[:user][:class_room_id]
    params[:user].delete :class_room_id
    @user = User.new(user_params)
    @user.password = "12345678"
    if @user.save
      @class_room = ClassRoomsUser.create(class_room_id: @class_room_id, user_id: @user.id)
      render json: @user, status: 200
    else
	    render json: { error: @user.errors.full_messages.join(", ") }, status: 422
    end
  end

  def user_params
     params.require(:user).permit!
  end

end
