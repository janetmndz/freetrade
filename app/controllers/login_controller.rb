class LoginController < ApplicationController
   before_action :signout, only: [:new]
    def new
    end

    def create
    
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            #set session["user_id"]
            session["user_id"] = @user.id
            flash[:message] = "Logging in #{@user.name}"
            redirect_to items_path

        else
            flash[:message] = "Incorrect email or password"
            redirect_to welcome_path
        end
    end
        
end
