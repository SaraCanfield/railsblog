class PostsController < ApplicationController

	def new
		@user = current_user
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = current_user.id
		if @post.save
			flash[:notice] = "Post was saved"
			redirect_to root_path
			
		else
			flash[:alert] = "Post was not saved"
			render 'new'
		end
		
	end

	def index
		@posts = Post.where(user_id: params[:user_id])

	end

	def show
		@post = Post.find(params[:id])

	end

	def edit
  		@post = Post.find(params[:id])
	end

	def update
  		@post = Post.update(params[:post])
		@post.user_id = current_user.id
  		if @post.update(post_params)
    		redirect_to root_path
  		else
    		render 'edit'
  		end
	end
	
     
end