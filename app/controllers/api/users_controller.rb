class UsersController < ApplicationController

    def create

    end

    def user_params
        params.permit(:username, :password)
    end
    
end
