class PostsController < ApplicationController
before_filter :authenticate, :except => [ :index, :show ]

	def new
	end

	def index
		@posts = Post.all
	end

	def create
		@post = Post.new(post_params)

		@post.save
		redirect_to @post
	end

	def show
		@post = Post.find(params[:id])
	end

		private
			def post_params
				params.require(:post).permit(:title, :content)
			end

			def authenticate
		    	authenticate_or_request_with_http_basic do |name, password|
		      	name == "hungvt4" && password == "ruby"
		    	end
		  	end
end
