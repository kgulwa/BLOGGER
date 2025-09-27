class PostsController < ApplicationController
  # Require user to be signed in for creating, editing, updating, deleting
  before_action :authenticate_user!, except: [:index, :show]

  # Load post from database for show, edit, update, destroy
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # Ensure only the user who created the post can edit/update/destroy
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
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
    redirect_to posts_path, alert: "You are not authorized." unless @post.user == current_user
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

