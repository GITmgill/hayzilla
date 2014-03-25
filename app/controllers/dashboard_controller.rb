class DashboardController < ApplicationController

	before_filter :authorize, only: [:index]

	def index
		@posts = Post.order("created_at DESC")
	end

end
