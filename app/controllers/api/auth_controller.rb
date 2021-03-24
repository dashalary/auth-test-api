class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]
    def login 

    end

    def auto_login
    end

    def user_is_authed
    end

end
