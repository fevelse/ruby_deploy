class SessionsController < ApplicationController
	def create
		user = User.find_by(email: user_params[:email])
		if user && user.authenticate(user_params[:password])
			session[:user_id] = user.id
			redirect_to user_path(user.id)
		else
			flash[:errors] = ["Invalid Credentials"]
			redirect_to :back
		end
	end
	def destroy
		session.clear
		redirect_to root_path
	end
	private
		def user_params
			params.require(:user).permit(:email, :password)
		end
end


