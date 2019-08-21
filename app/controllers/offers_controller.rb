class OffersController < ApplicationController
     before_action :autorized, only: [:index, :show, :new, :update, :create, :destroy]
   before_action :find_offer, only: [:show, :edit, :update, :destroy]
    def index
    @offers = @current_user.offers
    end

    def show

    end

    def new

    end

    def create
        @offer=Offer.create(offer_params)
        if @offer.valid?
        flash[:message]="New offer added"
       redirect_to @offer
     else
        flash[:errors]=@offer.errors.full_messages
        redirect_to new_offer_path
     end
    end

    def edit
    end

    def update
          @offer.update(offer_params)
        if @offer.valid?
        flash[:message]="Offer updated"
       redirect_to @offer
     else
        flash[:errors]=@offer.errors.full_messages
        redirect_to edit_offer_path
     end
    end

    def destroy
        @offer.destroy
    end
    
   def offer_params
     params.require(:offer).permit(:date,:status,:wanted_item_id,:offered_item_id)
   end
   
   def find_offer
     @offer = Offer.find(params[:id])
   end
end
 