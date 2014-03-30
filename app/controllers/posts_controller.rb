class PostsController < ApplicationController

	before_filter :authorize, only: [:edit, :update, :destroy, :create, :new]

	def index
	  @posts = Post.where(:state => "published").order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		redirect_to_good_slug(@post) and return if bad_slug?(@post)
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post].permit(post_params))
			redirect_to dashboard_path
		else
			render 'edit'
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to dashboard_path
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :text, :author, :short, :photo, :state)
	  end
end