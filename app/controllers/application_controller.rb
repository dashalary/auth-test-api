class ApplicationController < ActionController::API
    before_action :require_login

    def encode_token(payload)
    end

    def auth_header
    end

    def decoded_token
    end

    def session_user
    end

    def logged_in?
        !!session_user
    end

    def require_login
        render json: {message: 'You must be logged in to continue.'}, status: :unauthorized unless logged_in?
    end
end
