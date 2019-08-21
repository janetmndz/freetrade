class LoginController < ApplicationController
    def new
        
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            flash[:message] = "Logging in #{@user.name}"
            redirect_to items_path
        else
            flash[:message] = "Incorrect email or password"
            redirect_to welcome_path
        end
    end
end
