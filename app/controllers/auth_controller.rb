class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]

    def login 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back, #{user.username}!"}
        else
            render json: {failure: "Invalid username or password. Unable to log in."}
        end
    end

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "You are not logged in."}
        end
    end

    def user_is_authed
        render json: {message: "You are authorized."}
    end

end
