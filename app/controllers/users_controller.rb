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
  	session[:user_id] = @user.id
    redirect_to posts_path 
  	else
    redirect_to new_user_path
  	end
  end

  def show
  	@users = User.all
  	@user = User.find(params[:id])
  	@posts = @user.posts

  end
  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	@user.update(params[:user])
  	@user.save
  	redirect_to @user
  end

  def destroy
  end

end
