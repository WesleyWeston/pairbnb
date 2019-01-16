class UsersController < Clearance::UsersController

	def show
		@user =User.find(params[:id])
		@listing = Listing.all.where("user_id = #{params[:id]}")
	end


private

	def user_params
		params.require(:user).permit(
		:name,
		:email,
		:avatar,
		:password
		)
	end
end