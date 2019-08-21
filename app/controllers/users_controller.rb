class UsersController < ApplicationController
    def new
        
    end
    def create
        @user = User.create(user_params)
        if @user.valid?
            #Here is where we set the user in the session
            redirect_to items_path
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end

    end
    private
    def user_params
        params.require(:user).permit(:email, :password, :name, :age, :location, :bio)
    end
end
