class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy	
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted"
    redirect_to user_path, status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

