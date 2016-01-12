class UsersController < ApplicationController
  def index
  	@user = current_user
  end

  def new
  	@user = User.new
  end

  def create
	puts params.inspect
	@user = User.new(params[:user])
  	if @user.save
    redirect_to posts_path 
  	else
    redirect_to new_user_path
  	end
  end

  def show
    
  end

  def update
  end

  def destroy
  end

end
