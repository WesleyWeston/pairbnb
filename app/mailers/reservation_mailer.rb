class ReservationMailer < ApplicationMailer

	def booking_email(user,booking)
		@user = user
		@listing = Listing.find_by_id(booking.listing_id)
		@url = 'http://example.com/login'
		@complete_booking = booking
		

		
		mail(to: @user.email, subject: "Your booking")
	end


end
