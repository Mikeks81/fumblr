class SessionsController < ApplicationController
	def new	
	end

	def create
		@user = User.where(username: params[:username]).first
		if @user && @user.password == params[:password]
			flash[:notice] = "You're logged in"
			# flash.keep[:notice]
			session[:user_id] = @user.id
			redirect_to posts_path
		else
			flash[:notice] = "Incorrect username or password"
			redirect_to root_path
		end
	end

	def destroy
		@user = current_user
		if @user
			session[:user_id] = nil
			flash[:notice] = "Come back again soon!"
			redirect_to root_path
		else
			redirect_to root_path
		end
	end
end
