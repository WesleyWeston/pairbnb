class BookingsController < ApplicationController

	def create 
		@bookings = Booking.new(booking_params)
		
		@bookings.user_id = current_user.id
		@bookings.listing_id = params[:listing_id]

		
		

		if @bookings.save 
			redirect_to '/'
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
		:listing_id
		)
	end
end
