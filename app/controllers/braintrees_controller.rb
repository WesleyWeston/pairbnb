class BraintreesController < ApplicationController
  def new
  	@booking_id = params[:booking_id]
    @total_amount = Booking.find_by_id(@booking_id).total_price
  	@client_token = Braintree::ClientToken.generate
  end



  def checkout
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
  
  @complete_booking= Booking.find_by_id(params[:checkout_form][:booking_id])

  result = Braintree::Transaction.sale(
   :amount => @complete_booking.total_price, #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true

    }

   )

  if result.success?
    # ReservationMailer.booking_email(current_user,@complete_booking).deliver_now
    ReservationMailer.booking_email(current_user,@complete_booking).deliver_later(wait: 1.minute)
    @complete_booking.payment_status = true
    @complete_booking.save

    redirect_to :root, :flash => { :success => "Transaction successful!" }
  else
    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
  end
end
end
