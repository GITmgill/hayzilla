class StaticPagesController < ApplicationController
	def home
	end

	def about
	end

	def archive
	  	@posts = Post.all
	end
end
