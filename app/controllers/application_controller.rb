class ApplicationController < ActionController::API
    before_action :require_login

    def encode_token(payload)
        JWT.encode(payload, 'my_secret')
    end

    def auth_header
    end

    def decoded_token
        
    end

    def session_user
        decoded_hash = decoded_token
        if !decoded_hash.empty?
            user_id = decoded_hash[0]['user_id']
            @user = User.find_by(id: user_id)
        else
            nil 
        end
    end

    def logged_in?
        !!session_user
    end

    def require_login
        render json: {message: 'You must be logged in to continue.'}, status: :unauthorized unless logged_in?
    end
end
