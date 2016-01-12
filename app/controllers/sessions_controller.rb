class SessionsController < ApplicationController
	def new	
	end

	def create
		@user = User.where(username: params[:username]).first
		if @user && @user.password == params[:password]
			flash[:notice] = "You're logged in"
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:notice] = "Incorrect username or password"
			redirect_to log_in_path
		end
	end

	def destroy
		@user = current_user
		if @user
			session.clear
			flash[:notice]="Come back again soon!"
			redirect_to log_in_path
		else
			redirect_to log_in_path
		end
	end
end
