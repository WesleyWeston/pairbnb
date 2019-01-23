class Listing < ApplicationRecord

    	belongs_to :user
    	mount_uploader :images, ImagesUploader
    	has_many :bookings
    	

    	scope :bedrooms, ->(bedrooms) {where("bedrooms >= ?", bedrooms)}
    	scope :address, -> (address) {where("address ilike ?", "%#{address}%")}
    	# scope :price, -> (price) {where("price <= ?", price)}
    	scope :price_min, -> (min) {where("price >= ?", min)}
    	scope :price_max, -> (max) {where("price <= ?", max)}
    	
    	scope :verified, -> (verified) {where verified: true}

    	#"ilike as opposed to like in SQL makes the search query NOT case sensitive"


end