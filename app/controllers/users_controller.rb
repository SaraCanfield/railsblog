class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create 
		puts "*** CREATE PARAMS ARE HERE ***" 
		puts params



	# {"utf8"=>"✓",  "authenticity_token"=>"2k4f9Xp1qWRW3mM7b9bG7zlGqsrB
	# P6CaaHN8dOrObCzQoLWd27VlO2mwCiJqKGgPJjTupjW9KZNdtwDCOEt4ZA==",
	# "user"=>{"username"=>"SLSLSL",  "password"=>"LSLSLS"},
	# "commit"=>"Create User",  "controller"=>"users",
	# "action"=>"create"} end

	# CREATE a new user instance
		@user = User.new(params[:user])

		# check if the instance was saved successfully
		if@user.save
			flash[:notice] = "User was created"
		else
			flash[:alert] = "Problem creating user" 
		end

		redirect_to root_path
		#if it was, alert the user it was


		# otherwise error


		#redirect them somewhere
	end

end

