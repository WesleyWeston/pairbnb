class Listing < ApplicationRecord

    	belongs_to :user
    	mount_uploader :images, ImagesUploader
    	has_many :bookings
end