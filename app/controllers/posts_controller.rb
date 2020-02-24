class PostsController < ApplicationController
  def index
    if params[:user_id]
      begin
        @posts = User.find(params[:user_id]).posts.paginate(page: params[:page], per_page: 2)
      rescue => exception
        @posts = nil
      end
    else
      @posts = Post.paginate(page: params[:page], per_page: 2)
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy!
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :title, :content, :comments_count)
    end
end
