class ItemsController < ApplicationController
    
    before_action :set_up_auth_variables
   before_action :autorized, only: [:index, :show, :new, :update, :create, :destroy]
    # before_action :find_item, only: [:show, :edit, :update, :destroy]
    def index
       @items = @current_user.items
    end 

    def new
    end

    def create
      
    #  @item = Item.create(item_params)
     @item=Item.create(item_params, user_id: @user_id)
    #  if @item.valid?
    #     flash[:errors]="New item added"
    #    redirect_to @item
    #  else
    #     flash[:errors]=@item.errors.full_messages
    #     redirect_to new_item_path
    #  end

    end

    def show
        
     end
    def edit
    end
    def udpate
          @item.update(item_params,user_id)
     if @item.valid?
        flash[:errors]="Item was updated"
       redirect_to @item
     else
        flash[:errors]=@item.errors.full_messages
        redirect_to edit_item_path
     end
    end

    def destroy
    end

    def find_item
        @item=Item.find(param[:id])
    end
    def item_params

        params.require(:item).permit(:name, :description, :condition, :category,:trade)
    end
    

end
