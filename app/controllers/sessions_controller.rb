 class SessionsController < ApplicationController

 	def new



 	end

 	def create

 		params[:username]
 		params[:password]
 		#find user in database
 		user = User.where(username: params[:username]).first

 		#check if their pw is correct
 		if user

 			if user.password == params[:password]

 				session[:user_id] = user.id
 				flash[:notice] = "You are logged in"
 			else

 				flash[:alert] = "Incorrect Username/Password"
 			end


 		else
 			flash[:alert] = "Incorrect Username/Password"

 		end

 		redirect_to root_path
 		#if it is setup a new session
 		# if it's not
 		#tell them it's not
 		#redirect to another page



 	end

 	def destroy
 		session[:user_id] = nil
 		flash[:notice] = "You are signed out"
 		redirect_to root_path		
 	end

 end