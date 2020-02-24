class CommentsController < ApplicationController
  def index
    @posts = Comment.paginate(page: params[:page], per_page: 2)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    post = Post.find(@comment.post_id)
    redirect_to post_path(post)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to comment_path(@comment)
    else
      render 'edit'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy!
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :content)
    end
end
