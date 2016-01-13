class UsersController < ApplicationController
  def index
  	@user = current_user
  end

  def new
  	@user = User.new
  end

  def create
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
    @user = current_user
    if @user.destroy
      flash[:notice] = "This user was deleted"
    else
      flash[:notice] = "Unable to delete the user"
    end
    redirect_to root_path
  end

end
