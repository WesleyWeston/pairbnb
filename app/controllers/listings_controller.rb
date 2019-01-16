class ListingsController < ApplicationController
	
	def create
	
		
		@listings =Listing.new(listing_params)
		
		@listings.user_id = current_user.id

		if @listings.save
			redirect_to listings_path
		else 
			redirect_to "error"
		end

	end
	def new
      if !current_user.Customer?
        flash[:notice] = "Sorry. You are not allowed to perform this action."
        return redirect_to '/', notice: "Sorry. You do not have the permission to create a property."
      end
      # end authorization code

      # other code to make the new action work!
    end


	def index

		@listings = Listing.all.paginate(:page => params[:page], :per_page => 10)

	end

	def show
		@listing = Listing.find(params[:id])
		
	end






	private 
	def listing_params

	params.require(:listing).permit(
		:title,
		:description,
		:address,
		:property_type,
		:accomodation_type,
		:bedrooms,
		:occupant_limit,
		:images,
		:price
		)
	end
end