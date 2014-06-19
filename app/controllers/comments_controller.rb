class CommentsController < ApplicationController
	before_action :require_user

	def create
		@post = Post.find(params[:post_id]) #This line sets the post.id to the instance variable @post
		@comment = Comment.new(params.require(:comment).permit(:body))
		@comment.post = @post #This associates the comment to the specific post
		@comment.user = current_user

		if @comment.save
			flash[:notice] = "Your comment has been added"
			redirect_to post_path(@post)
		else	
			render "posts/show"
		end

	end

end

