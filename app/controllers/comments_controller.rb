class CommentsController < ApplicationController
  before_action :set_post

  def new
    @comment = @post.comments.new(comment_params)
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if @comment.user_id == current_user.id || @post.user_id == current_user.id
      @comment.destroy
      redirect_to post_path
    else
      redirect_to posts_path
    end
  end

  # def edit
  #   @comment=Comment.find(params[:id])
  # end
  # def update
  #   @comment = Comment.find(params[:id])
  #   if @comment.update(post_params)
  #     redirect_to comment_path
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end


