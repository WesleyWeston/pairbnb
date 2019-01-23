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

		@listings = Listing.all.paginate(:page => params[:page], :per_page => 12)
		@listings = @listings.bedrooms(params[:bedrooms]) if params[:bedrooms].present?
		@listings = @listings.address(params[:address]) if params[:address].present?
		
		@listings = @listings.price_min(params[:min]) if params[:min].present?
		@listings = @listings.price_max(params[:max]) if params[:max].present?
		@listings = @listings.verified(params[:verified]) if params[:verified] == '1'

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
		:price,
		:verified
		)
	end
end