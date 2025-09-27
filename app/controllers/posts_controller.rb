class PostsController < ApplicationController
  # Only logged-in users can create, edit, or delete posts
  before_action :authenticate_user!, except: [:index, :show]

  # Load the post for these actions
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # Ensure only the author can edit/update/destroy
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all  # Shows all posts to everyone
  end

  def show
  end

  def new
    @post = current_user.posts.build  # Link new post to signed-in user
  end

  def create
    @post = current_user.posts.build(post_params)  
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post was successfully deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    # Only allow the author to edit & update or destroy
    redirect_to posts_path, alert: "Not authorized" unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end


