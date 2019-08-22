class UsersController < ApplicationController
    before_action :signout, only: [:new]
    
    def new
        
    end
    
    def show
   
    end
    

    def create
        @current_user = User.create(user_params)
        if @current_user.valid?
            session["user_id"] = @current_user.id
            redirect_to items_path
        else
            flash[:errors] = @current_user.errors.full_messages
            redirect_to new_user_path
        end

    end

    def edit
        
    end

    def update
         @current_user.update(user_params_update)
        if @current_user.valid?
            #sessions["user_id"] = @current_user.id
            redirect_to @current_user
        else
            flash[:errors] = @current_user.errors.full_messages
            redirect_to edit_user_path(@current_user)
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :name, :age, :location, :bio)
    end
    def user_params_update
        params.require(:user).permit(:name, :age, :location, :bio)
    end
    def find_user
    end
end
