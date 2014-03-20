class PostsController < ApplicationController

	http_basic_authenticate_with name: "zillahay", password: "12321", except: [:index, :show]

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

		redirect_to posts_path
	end

	def index
	  @posts = Post.order("created_at DESC")
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :text, :author, :short, :photo)
	  end
end