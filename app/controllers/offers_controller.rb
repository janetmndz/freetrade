class OffersController < ApplicationController
before_action :autorized, only: [:index, :show, :new, :update, :create, :destroy]
   before_action :find_offer, only: [:show, :edit, :update,:accept, :decline, :destroy, :confirmed_offer]
    
   def index
    @pending_offers = @current_user.created_offers.select{|offer| offer.status == true} 
    @created_offers = @current_user.created_offers - @pending_offers
    @recieved_offers = @current_user.recieved_offers
    end

    def show

    end

    def new
      
    @offer= Offer.new
    @item=Item.find(params[:id])
      
    end

    def create
        @offer=Offer.create(offer_params)
       
        if @offer.valid?
        flash[:message]="New offer added"
       redirect_to @offer
     else
        flash[:errors]=@offer.errors.full_messages
        redirect_to offers_new_path
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

    def accept
       
        if @current_user.recieved_offers.include?(@offer)
        @offer.update(status:true)
        flash[:message]="Offer accepted."
         redirect_to offers_path
        #send email to @offer.offered_item.user.email
        else
      flash[:message]="Only reciever able to accept offer."
         redirect_to offers_path
       
        end
    end

  def decline
        
        @offer.update(status:false)
        flash[:message]="Offer declined."
         redirect_to offers_path
        #send email to @offer.offered_item.user.email
    end

    def destroy
        @offer.destroy
        redirect_to offers_path
    end
   def offer_params
     params.require(:offer).permit(:date,:status,:wanted_item_id,:offered_item_id)
   end
   
def confirmed_offer
    #keep the old user to review later
    @reviewee = @offer.wanted_item.user
    #destroy attatched offers
    @offer.wanted_item.created_offers.destroy_all()
    @offer.offered_item.created_offers.destroy_all()
    @offer.wanted_item.recieved_offers.destroy_all()
    @offer.offered_item.recieved_offers.destroy_all()
    #here we switch item owner
    @offer.offered_item.update(user:@offer.wanted_item.user)
    @offer.wanted_item.update(user:@current_user)
    #destroy offer after it has been cofirmed
    @offer.destroy
    #one time chance to make a review
    flash[:id] = @reviewee.id
    redirect_to new_review_path
end

   def find_offer
     @offer = Offer.find(params[:id])
   end

end
 