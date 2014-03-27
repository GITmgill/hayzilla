class DashboardController < ApplicationController

	before_filter :authorize, only: [:index]

	def index
		@posts = Post.all
		@comments = Comment.where(params[:post_id => -1])
		
	end

end
