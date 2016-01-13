class UsersController < ApplicationController
  def index
  	@user = current_user
  end

  def new
  	@user = User.new
  end

  def create
	@user = User.new(user_params)
  	if @user.save
  	session[:user_id] = @user.id
    flash[:notice] = "Thanks for joining!"
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
  	@user.update(user_params)
  	@user.save
  	redirect_to @user
  end

  def destroy
    @user = current_user
    if @user.destroy
      session.clear
      flash[:notice] = "This user was deleted"
    else
      flash[:notice] = "Unable to delete the user"
    end
    redirect_to root_path
  end
  
  private   
   def user_params
      params.require(:user).permit(:fname, :lname, :username, :email, :password)   
   end

   # @post = Post.find(params[:post_id])
   # @comment = @post.comments.build(comment_params)
   # @comment.user = current_user
   # @comment.save

end
