class ItemsController < ApplicationController
    
   before_action :autorized, only: [:index, :show, :new, :update, :create, :destroy, :my_items]
   before_action :find_item, only: [:show, :edit, :update, :destroy]
    def index
       @items = Item.all-@current_user.items
    end 

    def new
        @item=Item.new
    end
    
    def my_items
        @items=@current_user.items
    end
    def create
      
    @item = Item.create(item_params)
       if @item.valid?
        flash[:message]="New item added"
       redirect_to @item
     else
        flash[:errors]=@item.errors.full_messages
        redirect_to new_item_path
     end

    end

    def show
        
     end
    def edit
    end
    def update
          @item = Item.create(item_params)
       if @item.valid?
        flash[:message]="Item was updated"
       redirect_to @item
     else
        flash[:errors]=@item.errors.full_messages
        redirect_to edit_item_path
     end
    end

    def destroy
        @item.destroy
        redirect_to my_items_path
    end

    def logout
        signout
        redirect_to welcome_path
    end

    def find_item
        @item = Item.find(params[:id])
    end
    def item_params

        params.require(:item).permit(:name, :description, :condition, :category,:trade, :image_url, :user_id)
    end
    

end
