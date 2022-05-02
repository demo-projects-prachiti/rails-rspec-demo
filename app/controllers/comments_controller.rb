class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		 respond_to do |format|
      format.js {render layout: false}
      format.html { render 'new'} 
    end
	end

	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
 	end

	private

  def comment_params
    params.require(:comment).permit(:body, :commentor, :post_id)
  end
end