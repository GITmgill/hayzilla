class UsersController < ApplicationController

	before_filter :authorize, only: []


	def new
		@user = User.new
	end

	def create
		@user = User.new(users_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Thank you for signing up!"
		else
			render "new"
		end
	end

	def index
	end

  private
	def users_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
