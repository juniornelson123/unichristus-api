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
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
	    render json: { error: @user.errors.full_messages.join(", ") }, status: 422
    end
  end

  def user_params
     params.require(:user).permit!
  end

end
