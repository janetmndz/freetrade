class ReviewsController < ApplicationController
before_action :find_review, only: (:show)
     def show
     end

    def new
       
        @review= Review.new
        if flash[:id]
        @reviewee=User.find(flash[:id])
        else 
            redirect_to items_path
        end
    end

     def create
        byebug
       @review = Review.create(review_params)
       if @review.valid?
        flash[:message]="Review added"
       redirect_to @review
     else
        flash[:errors]=@review.errors.full_messages
        redirect_to new_review_path
     end
    end

    def find_review
        @review=Review.find(params[:id])
    end
  
def review_params
    params.require(:review).permit(:reviewee_id, :reviewer_id, :review )
end

end
