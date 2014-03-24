class PostsController < ApplicationController

	before_filter :authorize, only: [:edit, :update, :destroy, :create, :new, :dashboard]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
		redirect_to_good_slug(@post) and return if bad_slug?(@post)
	end

	def archive
	  	@posts = Post.all
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :text, :author, :short, :photo))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to dashboard_path
	end

	def index
	  @posts = Post.order("created_at DESC")
	end

	def dashboard
		@posts = Post.all
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :text, :author, :short, :photo)
	  end
end