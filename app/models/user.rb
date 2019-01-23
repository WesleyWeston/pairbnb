class User < ApplicationRecord
  include Clearance::User

  mount_uploader :avatar, AvatarUploader

 has_many :authentications, dependent: :destroy

 # Role value relates to array index value.

 enum role:[:Customer, :Moderator, :Superadmin]

 def self.create_with_auth_and_hash(authentication, auth_hash)
  
   user = self.new(
     name: auth_hash["info"]["name"],
     email: auth_hash["info"]["email"],
     password: SecureRandom.hex(10)
   )
   user.remote_avatar_url = auth_hash["info"]["image"]
   user.save
   user.authentications << authentication
   return user
 end

 # grab google to access google for user data
 def google_token
   x = self.authentications.find_by(provider: 'google_oauth2')
   return x.token unless x.nil?
 end
  
end
