class DashboardController < ApplicationController

	before_filter :authorize, only: [:index]

	def index
		@posts = Post.all
		@comments = Comment.all
	end
end
