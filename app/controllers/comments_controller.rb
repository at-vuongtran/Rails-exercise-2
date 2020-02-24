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
    @comment = Comment.new(post_params)
    if @comment.save
      redirect_to comment_path(@comment)
    else
      render 'new'
    end
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
      params.require(:comment).permit(:name, :email, :gender, :address, :phone_number, :comments_count)
    end
end
