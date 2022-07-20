class SessionsController < ApplicationController
    skip_before_action :authorized

    def get_current_user
        render json: {user: current_user}
    end

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            @token = encode_token({user_id: @user.id})
            render json: {user: @user, token: @token}, status: :ok, location: @user
        else
            render json: {errors: ["Incorrect username or password"]}, status: :unprocessable_entity
        end
    end
end
