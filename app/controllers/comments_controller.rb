class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: { comment: @comment, user: @comment.user, post: @comment.post }
    else
      render json: {data: "unsuccess"}
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      post = @comment.post
      flash[:notice] = "Updated!"
      redirect_to post
    else
      render :edit
    end
  end

  def destroy
    begin
      @comment = Comment.find(params[:id])
      post = @comment.post
      @comment.destroy!
      flash[:notice] = "You have just delete a comment"
      redirect_to post
    rescue => exception
      
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :content)
    end
end
