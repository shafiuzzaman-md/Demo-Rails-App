class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_path(@user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

    	
  def destroy	
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to users_url
  end

  private
    def post_params
      params.require(:post).permit(:title, :message, DateTime.now(), DateTime.now())
    end
end
