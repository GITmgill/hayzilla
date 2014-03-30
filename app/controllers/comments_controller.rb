class CommentsController < ApplicationController

	before_filter :authorize, only: [:destroy, :show, :edit]
	before_action :find_post, only: [:create, :edit, :destroy]
	before_action :find_comment, only: [:edit, :destory]

	def create
		@comment =
		@post.comments.create(comments_params)
		redirect_to post_path(@post)
	end

	def edit
		@comment.update_attribute(:flag, 'true')
		redirect_to post_path(@post)
	end

	def destroy
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
		def comments_params
			params.require(:comment).permit(:commenter, :body)
		end
		def find_post
			@post = Post.find(params[:post_id])
		end
		def find_comment
			@comment = @post.comments.find(params[:id])
		end
end
