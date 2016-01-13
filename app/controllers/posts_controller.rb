class PostsController < ApplicationController
  
  def index
  		@post = Post.new
		@posts = Post.all
		@user = current_user
	end

	def show
		@post = Post.find(params[:id])
		# @user = @post.comment.user
		@comment = Comment.new
	end

	def new
		@post = Post.new
		@user = current_user
	end

	def create
		# @user = current_user
		# @post = Post.new(params[:post]).merge(user_id: @user.id)
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:notice] = "Thanks for posting!"
			redirect_to posts_path
		else
			flash[:notice] = "Unable to post...try again?"
			redirect_to new_post_path
		end
	end

	def edit
		@user = current_user
		@post = Post.find(params[:id])
	end

	def update
		@user = current_user
		@post = Post.find(params[:id])
		@post.update(post_params)
		@post.save
		flash[:notice] = "Thanks for editing"
		redirect_to posts_path
	end

	def destroy
		@user = current_user
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "Post destroyed"
		else
			flash[:notice] = "Unable to destoy post"		
		end
		redirect_to posts_path
	end
	
   private
   	def post_params
   		params.require(:post).permit(:title, :body)
   	end
end
