class PostsController < ApplicationController
  before_action :set_post , only: [:edit , :update,:show]
  def index
    @posts = Post.all
  end

  def show ;end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post Successfully Posted'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit;end

  def update
    if @post.update(post_params)
      redirect_to post_path , notice: "Post Successfully Updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_path,alert: 'Post Deleted'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :all_tags)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
