class CommentsController < ApplicationController

	before_filter :authorize, only: [:destroy, :show]

	def create
		@post = Post.find(params[:post_id])
		@comment =
		@post.comments.create(comments_params)
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.update_attribute(:flag, 'true')
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
		def comments_params
			params.require(:comment).permit(:commenter, :body)
		end
end
