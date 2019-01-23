class BookingsController < ApplicationController

	def create 
		@booking = Booking.new(booking_params)
		
		@booking.user_id = current_user.id
		@booking.listing_id = params[:listing_id]
		@booking.days = @booking.end_date - @booking.start_date
		if @booking.days < 1 
			redirect_to "error"
		end
		@booking.total_price = @booking.days * Listing.find_by_id(params[:listing_id]).price
		
		

		if @booking.save 

			redirect_to new_booking_braintree_path(@booking.id)
		else
			redirect_to "error"
		end
	end

	def new
	end

	def show
		@booking = bookings.find(params[:id])
	end


	private 
	def booking_params

	params.require(:booking).permit(
		:start_date,
		:end_date,
		:listing_id,
		:days,
		:total_price
		)
	end
end
