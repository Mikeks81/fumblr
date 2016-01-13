class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comment_params)
  	@comment.user = current_user
  	@comment.save
  	redirect_to post_path(@post)
  end

  def new
  end

  def edit
  	@comment = Comment.find(params[:id])
  	@post = Post.find(params[:post_id])
  end

  def update
  	@post = Post.find(params[:post_id])
  	@comment = Comment.find(params[:id])
	@comment.update(comment_params)
	@comment.save
	flash[:notice] = "Thanks for editing"
	redirect_to post_path(@post)
  end

  def destroy
  	@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		if @comment.destroy
			flash[:notice] = "Comment destroyed"
		else
			flash[:notice] = "Unable to destoy comment"		
		end
		redirect_to post_path(@post)
	end

  private
  def comment_params
  	params.require(:comment).permit(:content)
  end	
end
