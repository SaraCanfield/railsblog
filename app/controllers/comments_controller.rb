class CommentsController < ApplicationController

	def create
		@comment = Comment.new(params[:comment])
		@comment.user_id = session[:user_id]
		if @comment.save
			flash[:notice] = "Thank you for your comment"
		else
			flash[:alert] = "Comment did not post"
		end
		redirect_to :back
	end



end