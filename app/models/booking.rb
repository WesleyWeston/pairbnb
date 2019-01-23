class Booking < ApplicationRecord
	belongs_to :user
	has_one :listing
	validates :start_date, :end_date, :overlap => {:scope => "listing_id"}
	
end