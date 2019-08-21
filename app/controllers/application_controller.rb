class ApplicationController < ActionController::Base
before_action :set_up_auth_variables

    def set_up_auth_variables
        
        @user_id = session["user_id"]
        @loged_in = !!session["user_id"]
        if @loged_in
           @current_user=User.find(@user_id)
        end
    end


    def autorized
        #byebug
       if !@loged_in
            return redirect_to welcome_path
        end

    end

    def signout
        session["user_id"]=nil
    end
end
