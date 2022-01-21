class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post
  before_action :set_comment ,only: [:show, :edit, :update, :destroy]

  def new
    @comment = @post.comments.new(comment_params)
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post , notice: 'Successfully commented'
    else
       redirect_to @post , alert: 'Blank comment'
    end
  end

  def show ;end

  def destroy
    if can? :destroy ,@comment
    # if @comment.user_id == current_user.id
      # || @post.user_id == current_user.id
      @comment.destroy
      redirect_to @post, alert: 'Comment Destroyed'
    else
      redirect_to @post
    end
  end

  def edit ;end
  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment Updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment=current_user.comments.find(params[:id])
  end
end


