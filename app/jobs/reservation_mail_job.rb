class ReservationMailJob < ApplicationJob
  queue_as :default

  def perform(current_user)
  	user = User.find(user_id)
  	user.send_booking_email
   
  end
end
